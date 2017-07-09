# get fabric keys from local env file
ENV_FILE="${SRCROOT}/fastlane/.env"
if [ -f $ENV_FILE ]; then
    source ${ENV_FILE}
fi

if [ ${CONFIGURATION} = "AppStore" ]; then
    echo "Running Crashlytics for this build"
    echo "Will upload to production Organization"
    "${PODS_ROOT}/Fabric/run" $CRASHLYTICS_API_TOKEN $CRASHLYTICS_BUILD_SECRET

elif [ ${CONFIGURATION} = "Release" ]; then
    echo "Running Crashlytics for this build"
    echo "Will upload to development Organization"
    "${PODS_ROOT}/Fabric/run" $CRASHLYTICS_API_TOKEN $CRASHLYTICS_BUILD_SECRET

elif [ ${CONFIGURATION} = "Debug" ]; then
    echo "Not Running Crashlytics for this build"
else
    echo "Not Running Crashlytics for this build"
fi