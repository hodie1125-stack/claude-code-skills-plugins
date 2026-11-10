# 클로드 코드 스킬과 플러그인 설치

Claude Code의 **스킬(Skill)** 과 **플러그인(Plugin)** 을 만들고 설치하는 방법을 직접 따라 해 볼 수 있는 예제 프로젝트입니다.

## 프로젝트 구조

```
claude-code-skills-plugins/
├── .claude/
│   └── skills/
│       └── hello-korean/SKILL.md          # 프로젝트 스킬 예제
├── .claude-plugin/
│   └── marketplace.json                   # 이 저장소를 플러그인 마켓플레이스로 등록
├── plugins/
│   └── korean-helper/                     # 플러그인 예제
│       ├── .claude-plugin/plugin.json     # 플러그인 메타데이터
│       ├── commands/review-ko.md          # 슬래시 명령어 (/review-ko)
│       └── skills/commit-message-ko/SKILL.md
└── scripts/
    └── install-skill.sh                   # 스킬을 개인 폴더(~/.claude/skills)에 복사
```

---

## 1. 스킬(Skill)

스킬은 `SKILL.md` 파일 하나가 들어 있는 폴더입니다. 맨 위 frontmatter의
`description`을 보고 Claude가 언제 이 스킬을 쓸지 스스로 판단합니다.

```markdown
---
name: hello-korean
description: 사용자가 한국어 인사말이나 자기소개 문구를 요청할 때 사용
---
(Claude에게 줄 지시 사항)
```

### 스킬 설치 위치

| 범위 | 위치 | 설명 |
|------|------|------|
| 프로젝트 | `.claude/skills/<이름>/SKILL.md` | 이 저장소에서만 사용, git으로 팀과 공유 |
| 개인 | `~/.claude/skills/<이름>/SKILL.md` | 내 모든 프로젝트에서 사용 |
| 플러그인 | `<플러그인>/skills/<이름>/SKILL.md` | 플러그인 설치 시 함께 설치 |

### 설치 방법

- **프로젝트 스킬**: 이 폴더에서 `claude`를 실행하면 `hello-korean` 스킬이 자동으로 로드됩니다.
- **개인 스킬로 복사**:

```bash
./scripts/install-skill.sh hello-korean
```

설치 확인: Claude Code 안에서 `/skills` 를 입력하거나 "어떤 스킬을 쓸 수 있어?"라고 물어보세요.

---

## 2. 플러그인(Plugin)

플러그인은 스킬·슬래시 명령어·에이전트·훅·MCP 서버를 하나로 묶어 배포하는 단위입니다.
플러그인은 **마켓플레이스**를 통해 설치합니다.

### 이 저장소의 예제 플러그인 설치

Claude Code 안에서 다음 명령을 차례대로 입력합니다.

```
/plugin marketplace add ./
```

```
/plugin install korean-helper@claude-code-skills-plugins
```

GitHub에 올린 뒤에는 다른 사람도 이렇게 설치할 수 있습니다.

```
/plugin marketplace add <깃허브아이디>/claude-code-skills-plugins
```

설치 후 Claude Code를 재시작하면:
- `/review-ko` 명령어로 코드 리뷰를 한국어로 받을 수 있고
- 커밋 메시지를 부탁하면 `commit-message-ko` 스킬이 동작합니다.

### 플러그인 관리

| 작업 | 명령 |
|------|------|
| 플러그인 메뉴 열기 | `/plugin` |
| 마켓플레이스 목록 | `/plugin marketplace list` |
| 플러그인 비활성화 | `/plugin disable korean-helper@claude-code-skills-plugins` |
| 플러그인 제거 | `/plugin uninstall korean-helper@claude-code-skills-plugins` |

### 공식 마켓플레이스

Anthropic 공식 플러그인도 같은 방식으로 설치합니다.

```
/plugin marketplace add anthropics/claude-code
```

---

## 3. 나만의 스킬/플러그인 만들기

1. `plugins/korean-helper` 폴더를 복사해 이름을 바꿉니다.
2. `.claude-plugin/plugin.json`의 `name`, `description`을 수정합니다.
3. `.claude-plugin/marketplace.json`의 `plugins` 배열에 새 항목을 추가합니다.
4. `/plugin marketplace update claude-code-skills-plugins` 후 설치합니다.

## 참고 문서

- 스킬: https://code.claude.com/docs/en/skills
- 플러그인: https://code.claude.com/docs/en/plugins
- 플러그인 마켓플레이스: https://code.claude.com/docs/en/plugin-marketplaces

---

## 4. 설치된 외부 플러그인

이 프로젝트의 `.claude/settings.json`에 아래 플러그인이 등록되어 있습니다.
저장소를 받은 뒤 이 폴더에서 `claude`를 실행하고 폴더를 신뢰하면 설치하라는 안내가 나옵니다.

| 플러그인 | 저장소 | 용도 |
|---|---|---|
| `ponytail@ponytail` | [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) | 가장 단순한 코드만 쓰게 하는 "게으른 시니어 개발자" 모드 |
| `impeccable@impeccable` | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | 프론트엔드 디자인 품질 향상 (`/impeccable polish`, `audit`, `critique` 등) |

Impeccable은 처음 한 번 `/impeccable init`을 실행하세요.
