#!/bin/bash
# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -o errexit

scripts_dir="$(dirname "${BASH_SOURCE[0]}")"
GIT_DIR="$(realpath $(dirname ${BASH_SOURCE[0]})/..)"

# make sure we're running as the owner of the checkout directory
RUN_AS="$(ls -ld "$scripts_dir" | awk 'NR==1 {print $3}')"
if [ "$USER" != "$RUN_AS" ]
then
    echo "This script must run as $RUN_AS, trying to change user..."
    exec sudo -u $RUN_AS $0
fi
clear
# echo ""
# read -r -p "Enter the your full credential file name including the path and .json extension: " credname
# echo ""


sudo apt-get update -y
sed 's/#.*//' ${GIT_DIR}/scripts/system.txt | xargs sudo apt-get install -y


#Check OS Version
echo ""
echo "Checking OS Compatability"
echo ""
if [[ $(cat /etc/os-release|grep "raspbian") ]]; then
  if [[ $(cat /etc/os-release|grep "stretch") ]]; then
    osversion="Raspbian Stretch"
    echo ""
    echo "You are running the installer on Stretch="
    echo ""
  elif [[ $(cat /etc/os-release|grep "buster") ]]; then
    osversion="Raspbian Buster"
    echo ""
    echo "You are running the installer on Buster"
    echo ""
  elif [[ $(cat /etc/os-release|grep "bullseye") ]]; then
    osversion="Raspbian Bullseye"
    echo ""
    echo "You are running the installer on Bullseye"
    echo ""
  else
    osversion="Other Raspbian"
    echo ""
    echo "You are advised to use the Stretch or Buster or Bullseye version of the OS"
    echo "Exiting the installer="
    echo ""
    exit 1
  fi
elif [[ $(cat /etc/os-release|grep "armbian") ]]; then
  if [[ $(cat /etc/os-release|grep "stretch") ]]; then
    osversion="Armbian Stretch"
    echo ""
    echo "You are running the installer on Stretch"
    echo ""
  elif [[ $(cat /etc/os-release|grep "buster") ]]; then
    osversion="Armbian Buster"
    echo ""
    echo "You are running the installer on Buster"
    echo ""
  elif [[ $(cat /etc/os-release|grep "bullseye") ]]; then
    osversion="Armbian Bullseye"
    echo ""
    echo "You are running the installer on Bullseye"
    echo ""
  else
    osversion="Other Armbian"
    echo ""
    echo "You are advised to use the Stretch version of the OS"
    echo "Exiting the installer="
    echo ""
    exit 1
  fi
elif [[ $(cat /etc/os-release|grep "osmc") ]]; then
  osmcversion=$(grep VERSION_ID /etc/os-release)
  osmcversion=${osmcversion//VERSION_ID=/""}
  osmcversion=${osmcversion//'"'/""}
  osmcversion=${osmcversion//./-}
  osmcversiondate=$(date -d $osmcversion +%s)
  export LC_ALL=C.UTF-8
  export LANG=C.UTF-8
  if (($osmcversiondate > 1512086400)); then
    osversion="OSMC Stretch"
    echo ""
    echo "Compatible OSMC version"
    echo ""
  else
    osversion="Other OSMC"
    echo ""
    echo "You are advised to use atleast the Stretch version of the OS"
    echo "Exiting the installer="
    echo ""
    exit 1
  fi
elif [[ $(cat /etc/os-release|grep "ubuntu") ]]; then
  if [[ $(cat /etc/os-release|grep "bionic") ]]; then
    osversion="Ubuntu Bionic"
    echo ""
    echo "You are running the installer on Bionic"
    echo ""
  else
    osversion="Other Ubuntu"
    echo ""
    echo "You are advised to use the Bionic version of the OS"
    echo "Exiting the installer="
    echo ""
    exit 1
  fi
fi

#Check CPU architecture
if [[ $(uname -m|grep "armv7") ]] || [[ $(uname -m|grep "x86_64") ]] || [[ $(uname -m|grep "armv8") ]] || [[ $(uname -m|grep "aarch64") ]]; then
	devmodel="armv7"
  echo ""
  echo "Your board supports Ok-Google Hotword. You can also trigger the assistant using custom-wakeword"
  echo ""
else
	devmodel="armv6"
  echo ""
  echo "=Your board does not support Ok-Google Hotword. You need to trigger the assistant using pushbutton/custom-wakeword"
  echo ""
fi

#Check Board Model
if [[ $(cat /proc/cpuinfo|grep "BCM") ]]; then
	board="Raspberry"
  echo ""
  echo "GPIO pins can be used with the assistant"
  echo ""
else
	board="Others"
  echo ""
  echo "GPIO pins cannot be used by default with the assistant. You need to figure it out by yourselves"
  echo ""
fi

echo ""
cd /home/${USER}/

# python3 -m venv env
# env/bin/python3 -m pip install --upgrade pip setuptools wheel
#source env/bin/activate
pip install --upgrade pip setuptools wheel
pip config set global.disable-pip-version-check true
pip install -r ${GIT_DIR}/scripts/pip.txt
pip install git+https://github.com/longhd2/pafy.git

if [[ $board = "Raspberry" ]] && [[ $osversion != "OSMC Stretch" ]];then
	pip install RPi.GPIO==0.7.1a4
  if [ -f /lib/udev/rules.d/91-pulseaudio-rpi.rules ] ; then
      sudo rm /lib/udev/rules.d/91-pulseaudio-rpi.rules
  fi
fi

if [[ $devmodel = "armv7" ]];then
	pip install google-assistant-library==1.1.0
else
  pip install --upgrade --no-binary :all: grpcio
fi

pip install google-assistant-grpc==0.3.0
pip install google-assistant-sdk==0.6.0
pip install google-assistant-sdk[samples]==0.6.0
# google-oauthlib-tool --scope https://www.googleapis.com/auth/assistant-sdk-prototype \
          # --scope https://www.googleapis.com/auth/gcm \
          # --save --headless --client-secrets ${GIT_DIR}/json/.vipi.json



echo ""
echo ""
sudo mv ${GIT_DIR}/scripts/wifi-connect-start.service /lib/systemd/system/wifi-connect-start.service
sudo systemctl enable wifi-connect-start.service
sudo systemctl start wifi-connect-start.service

set -u
trap "exit 1" TERM
export TOP_PID=$$

: "${WFC_REPO:=balena-os/wifi-connect}"
: "${WFC_INSTALL_ROOT:=/usr/local}"

SCRIPT='raspbian-install.sh'
NAME='WiFi Connect Raspbian Installer'

INSTALL_BIN_DIR="$WFC_INSTALL_ROOT/sbin"
INSTALL_UI_DIR="$WFC_INSTALL_ROOT/share/wifi-connect/ui"

RELEASE_URL="https://api.github.com/repos/balena-os/wifi-connect/releases/latest"

CONFIRMATION=false


main() {
    for arg in "$@"; do
        case "$arg" in
            -h|--help)
                usage
                exit 0
                ;;
            -y)
                CONFIRMATION=false
                ;;
            *)
                ;;
        esac
    done

    need_cmd id
    need_cmd curl
    need_cmd systemctl
    need_cmd apt-get
    need_cmd grep
    need_cmd mktemp

    check_os_version

    install_wfc

    activate_network_manager

}

check_os_version() {
    local _version=""

    if [ -f /etc/os-release ]; then
        _version=$(grep -oP 'VERSION="\K[^"]+' /etc/os-release)
    fi

    if [ "$_version" == "8 (jessie)" ]; then
        err "Distributions based on Debian 8 (jessie) are not supported"
    fi
}

activate_network_manager() {
    if [ "$(service_load_state NetworkManager)" = "not-found" ]; then
        say 'NetworkManager is not installed'

        # Do not install NetworkManager over running dhcpcd to avoid clashes

        say 'Downloading NetworkManager...'

        ensure sudo apt-get update

        ensure sudo apt-get install -y -d network-manager

        disable_dhcpcd

        say 'Installing NetworkManager...'

        ensure sudo apt-get install -y network-manager

        ensure sudo apt-get clean
    else
        say 'NetworkManager is already installed'

        if [ "$(service_active_state NetworkManager)" = "active" ]; then
            say 'NetworkManager is already active'
        else

            disable_dhcpcd

            say 'Activating NetworkManager...'

            ensure sudo systemctl enable NetworkManager

            ensure sudo systemctl start NetworkManager
        fi
    fi

    if [ ! "$(service_active_state NetworkManager)" = "active" ]; then
        err 'Cannot activate NetworkManager'
    fi
}

disable_dhcpcd() {
    if [ "$(service_active_state dhcpcd)" = "active" ]; then
        say 'Deactivating and disabling dhcpcd...'

        ensure sudo systemctl stop dhcpcd

        ensure sudo systemctl disable dhcpcd

        if [ "$(service_active_state dhcpcd)" = "active" ]; then
            err 'Cannot deactivate dhcpcd'
        else
            say 'dhcpcd successfully deactivated and disabled'
        fi
    else
        say 'dhcpcd is not active'
    fi
}

service_load_state() {
    ensure sudo systemctl -p LoadState --value show "$1"
}

service_active_state() {
    ensure sudo systemctl -p ActiveState --value show "$1"
}


install_wfc() {
    local _regex='browser_download_url": "\K.*rpi\.tar\.gz'
    local _arch_url
    local _wfc_version
    local _download_dir


    _arch_url=$(ensure curl "$RELEASE_URL" -s | grep -hoP "$_regex")

    _download_dir=$(ensure mktemp -d)

    ensure curl -Ls "$_arch_url" | tar -xz -C "$_download_dir"

    ensure sudo cp "$_download_dir/wifi-connect" $INSTALL_BIN_DIR

    ensure sudo mkdir -p $INSTALL_UI_DIR

    ensure sudo rm -rdf $INSTALL_UI_DIR

    ensure sudo cp ${GIT_DIR}/scripts/ui $INSTALL_UI_DIR

    ensure rm -rdf "$_download_dir"

    _wfc_version=$(ensure wifi-connect --version)

    say "Cài đặt thành công $_wfc_version"
}

say() {
    printf '\33[1m%s:\33[0m %s\n' "$NAME" "$1"
}

err() {
    printf '\33[1;31m%s:\33[0m %s\n' "$NAME" "$1" >&2
    kill -s TERM $TOP_PID
}

need_cmd() {
    if ! command -v "$1" > /dev/null 2>&1; then
        err "need '$1' (command not found)"
    fi
}

ensure() {
    "$@"
    if [ $? != 0 ]; then
        err "command failed: $*";
    fi
}

main "$@" || exit 1

echo "Hoàn thành cài đặt, vui lòng reboot........"
