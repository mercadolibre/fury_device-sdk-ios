#!/bin/sh
set -v
set -o pipefail

IOS_VERSION="${1:-10.3.1}"
IOS_DEVICE="${2:-iPhone 6}"

export XCPRETTY_JSON_FILE_OUTPUT="build/reports/result_$IOS_VERSION.json"
FORMATTER="xcpretty -f `bundle exec xcpretty-json-formatter`"

IOS_SIMULATOR_UDID=$(xcrun instruments -s devices | grep "$IOS_DEVICE ($IOS_VERSION)" | sed -E 's/.*\[([0-9A-F-]+)\].*/\1/g' | head -n 1)
ABC=$(xcrun instruments -s devices)
echo $ABC
echo $IOS_SIMULATOR_UDID

echo "Prelaunching iOS simulator"
open `xcode-select -p`/Applications/Simulator.app --args -CurrentDeviceUDID $IOS_SIMULATOR_UDID

xcodebuild -workspace devices.xcworkspace \
           -scheme TestsApp \
           -sdk "iphonesimulator" \
           -destination "platform=iOS Simulator,id=$IOS_SIMULATOR_UDID" \
           test | $FORMATTER
