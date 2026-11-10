# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack

delegated: 정적 HTML/CSS를 기본으로 한다. 저장소에 빌드 도구나 프레임워크가 없고 만들 화면도 아직 정해지지 않았으므로, 의존성 없이 바로 열어 볼 수 있고 GitHub Pages 같은 정적 호스팅에 그대로 올릴 수 있는 방식이 학습용 저장소에 가장 맞다. 상호작용이 많은 화면이 필요해지면 그때 다시 정한다.

## Users

저장소 소유자 한 명. Claude Code의 스킬과 플러그인을 직접 만들고 설치해 보며 배우는 개인 학습·실험용 저장소다. 문서와 예제는 한국어로 쓴다.

## Product Purpose

Claude Code의 스킬(Skill)과 플러그인(Plugin)을 만들고, 마켓플레이스로 등록하고, 설치하는 과정을 직접 따라 해 볼 수 있는 예제 모음이다. 성공 기준은 각 예제가 실제로 설치되고 동작하는 것을 확인하는 것이다.

## Operating Context

- Claude Code CLI와 클라우드 세션에서 사용한다.
- 프로젝트 스킬은 `.claude/skills/`, 예제 플러그인은 `plugins/`, 마켓플레이스 정의는 `.claude-plugin/marketplace.json`에 있다.
- 외부 플러그인(`ponytail`, `impeccable`)은 `.claude/settings.json`에서 프로젝트 범위로 등록·활성화한다.
- 개인 스킬 설치는 `scripts/install-skill.sh`로 한다.

## Capabilities and Constraints

- 포함된 예제: `hello-korean` 프로젝트 스킬, `korean-helper` 플러그인(`/review-ko` 명령, `commit-message-ko` 스킬).
- 아직 웹 화면이 없다. impeccable로 만들거나 다듬을 화면은 미정(open decision)이다.

## Evidence on Hand

- `README.md`: 프로젝트 구조, 설치 방법, 관리 명령을 한국어로 설명.
- 실사용자 후기, 사용 통계, 로고·브랜드 자산은 없다. 앞으로의 작업에서 이런 것을 지어내지 않는다.

## Product Principles

1. 직접 따라 해서 동작을 확인할 수 있는 최소한의 예제를 우선한다.
2. 설명과 지시문은 쉬운 한국어로 쓴다.
3. 예제 구조는 Claude Code의 공식 디렉터리 규칙을 그대로 따른다.
