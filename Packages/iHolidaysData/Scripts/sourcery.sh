unset SDKROOT
if which mint >/dev/null; then
	echo "${PODS_TARGET_SRCROOT}"
  mint run krzysztofzablocki/Sourcery@1.2.1 sourcery --config "${PODS_TARGET_SRCROOT}" --verbose
else
  echo "error: Mint not installed, download from https://github.com/yonaskolb/mint"
fi