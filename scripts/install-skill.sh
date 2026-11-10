#!/usr/bin/env bash
# 프로젝트 스킬을 개인 스킬 폴더(~/.claude/skills)로 복사합니다.
# 사용법: ./scripts/install-skill.sh <스킬이름>   (인자 없으면 목록 출력)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC_DIR="$ROOT/.claude/skills"
DEST_DIR="${HOME}/.claude/skills"

if [[ $# -eq 0 ]]; then
  echo "설치 가능한 스킬:"
  ls -1 "$SRC_DIR"
  echo
  echo "사용법: $0 <스킬이름>"
  exit 0
fi

NAME="$1"
if [[ ! -f "$SRC_DIR/$NAME/SKILL.md" ]]; then
  echo "오류: '$NAME' 스킬을 찾을 수 없습니다." >&2
  exit 1
fi

mkdir -p "$DEST_DIR"
if [[ -e "$DEST_DIR/$NAME" ]]; then
  echo "이미 존재합니다: $DEST_DIR/$NAME (덮어쓰려면 먼저 삭제하세요)" >&2
  exit 1
fi

cp -r "$SRC_DIR/$NAME" "$DEST_DIR/$NAME"
echo "설치 완료: $DEST_DIR/$NAME"
echo "Claude Code를 다시 시작하면 '$NAME' 스킬을 사용할 수 있습니다."
