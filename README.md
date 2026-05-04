# Typo-Tolerance

[![Pharo P14](https://img.shields.io/badge/Pharo-P14-2c98f0.svg)](https://github.com/pharo-completion/typo-tolerance)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/pharo-completion/typo-tolerance/blob/master/LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/pharo-completion/typo-tolerance/pulls)
[![Status: Active](https://img.shields.io/badge/status-active-success.svg)](https://github.com/pharo-completion/typo-tolerance)

Typo Tolerance is a Pharo extension that preserves prefix matching as the primary acceptance rule and uses approximate matching only as a fallback, with a configurable tolerance.

---

<img width="571" height="283" alt="TypoTolerance" src="https://github.com/user-attachments/assets/523efd67-1e94-4377-bcc4-dc4dd0a6c04e" />


---

```smalltalk
Metacello new
  githubUser: 'pharo-completion' project: 'typo-tolerance' commitish: 'main' path: 'src';
  baseline: 'TypoTolerance';
  load.
```
