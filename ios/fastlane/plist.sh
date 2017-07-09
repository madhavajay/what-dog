# get fabric keys from local env file
ENV_FILE="${SRCROOT}/fastlane/.env"
if [ -f $ENV_FILE ]; then
    source ${ENV_FILE}
fi

PLIST_FILE="${SRCROOT}/Info.plist"
function clearFabricKey() {
    /usr/libexec/PlistBuddy -c "Delete :Fabric" $PLIST_FILE || true
}

function addFabricKey() {
    /usr/libexec/PlistBuddy -c "Add :Fabric dict" -c "Add :Fabric:APIKey string '$CRASHLYTICS_API_TOKEN'" -c "Add :Fabric:Kits array" -c "Add :Fabric:Kits:0 dict" -c "Add :Fabric:Kits:0:KitInfo dict" -c "Add :Fabric:Kits:0:KitName string 'Crashlytics'" $PLIST_FILE
}

clearFabricKey

if [ ${CONFIGURATION} = "AppStore" ]; then
    echo "Adding Fabric Key to plist"
    addFabricKey
elif [ ${CONFIGURATION} = "Release" ]; then
    echo "Adding Fabric Key to plist"
    addFabricKey
fi