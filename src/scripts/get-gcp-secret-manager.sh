LATEST_VER=$(gcloud secrets versions list "${SECRET_NAME}" --limit=1 | awk '{print $1}' | sed -n 2p)
echo LATEST_VER = "${LATEST_VER}"

gcloud secrets versions access "${LATEST_VER}" \
  --secret="${SECRET_NAME}" --format='get(payload.data)' |
  tr '_-' '/+' |
  base64 -d >>./"${OUTPUT_PATH}"

cat ./"${OUTPUT_PATH}"