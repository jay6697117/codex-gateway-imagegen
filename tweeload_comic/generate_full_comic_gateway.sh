#!/usr/bin/env bash
set -euo pipefail

DIR="/Users/zhangjinhui/Desktop/codex-gateway-imagegen/tweeload_comic"
HELPER="/Users/zhangjinhui/Desktop/codex-gateway-imagegen/.claude/skills/codex-gateway-imagegen/scripts/generate_gateway_image.py"
PROMPT_FILE="$DIR/gateway_full_comic_prompt.txt"
OUT_FILE="$DIR/tweeload_story_comic_gateway.png"

python3 "$HELPER" \
  --prompt "$(cat "$PROMPT_FILE")" \
  --image "$DIR/reference_contact_sheet_3s.jpg" \
  --image "$DIR/reference_contact_sheet_1s.jpg" \
  --image "$DIR/reference_subtitles_sheet.jpg" \
  --action edit \
  --out "$OUT_FILE" \
  --size 1024x1536 \
  --max-retries 5

printf '%s\n' "$OUT_FILE"
