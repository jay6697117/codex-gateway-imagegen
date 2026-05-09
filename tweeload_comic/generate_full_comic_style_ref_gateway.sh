#!/usr/bin/env bash
set -euo pipefail

DIR="/Users/zhangjinhui/Desktop/codex-gateway-imagegen/tweeload_comic"
HELPER="/Users/zhangjinhui/Desktop/codex-gateway-imagegen/.claude/skills/codex-gateway-imagegen/scripts/generate_gateway_image.py"
PROMPT_FILE="$DIR/gateway_full_comic_prompt_style_ref.txt"
OUT_FILE="$DIR/tweeload_story_comic_style_ref_gateway.png"
LOG_FILE="$DIR/generate_style_ref.log"

python3 "$HELPER" \
  --prompt "$(cat "$PROMPT_FILE")" \
  --image "$DIR/reference_contact_sheet_3s.jpg" \
  --image "$DIR/reference_contact_sheet_1s.jpg" \
  --image "$DIR/reference_subtitles_sheet.jpg" \
  --action edit \
  --out "$OUT_FILE" \
  --size 1024x1536 \
  --max-retries 5 2>&1 | tee "$LOG_FILE"

printf '%s\n' "$OUT_FILE"
