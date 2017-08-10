#!/bin/sh
#comments
cd $(cd `dirname $0`; pwd)
WORKSPACE_NAME=MAMapKitDLL
SCHEME_NAME=${WORKSPACE_NAME}
FMK_NAME=${SCHEME_NAME}
BUILD_DIR=$(PWD)/Build
if [ -d "${BUILD_DIR}" ]
then
rm -r "${BUILD_DIR}"
fi
xcodebuild -workspace ${WORKSPACE_NAME}.xcworkspace -scheme ${SCHEME_NAME} OTHER_CFLAGS="-fembed-bitcode" -configuration "Release" -sdk iphoneos -derivedDataPath ${BUILD_DIR} clean build
xcodebuild -workspace ${WORKSPACE_NAME}.xcworkspace -scheme ${SCHEME_NAME} OTHER_CFLAGS="-fembed-bitcode" -configuration "Release" -sdk iphonesimulator -derivedDataPath ${BUILD_DIR} clean build
DEVICE_DIR=${BUILD_DIR}/Build/Products/Release-iphoneos/${FMK_NAME}.framework
SIMULATOR_DIR=${BUILD_DIR}/Build/Products/Release-iphonesimulator/${FMK_NAME}.framework
PRODUCT_DIR=$(PWD)/Product
INSTALL_DIR=${PRODUCT_DIR}/${FMK_NAME}.framework
if [ -d "${PRODUCT_DIR}" ]
then
rm -rf "${PRODUCT_DIR}"
fi
mkdir -p "${PRODUCT_DIR}"
cp -R "${DEVICE_DIR}" "${PRODUCT_DIR}"
if [ -d "${SIMULATOR_DIR}/Modules/${FMK_NAME}.swiftmodule" ]; then
cp -R "${SIMULATOR_DIR}/Modules/${FMK_NAME}.swiftmodule/" "${INSTALL_DIR}/Modules/${FMK_NAME}.swiftmodule/"
fi
lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"
# rm -r "${BUILD_DIR}"
open "${INSTALL_DIR}"