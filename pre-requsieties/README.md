# 📋 Wymagania wstępne

Przygotuj poniższe konta, narzędzia i dostępy **przed warsztatem**.

---

## 💻 Sprzęt

- Laptop z systemem Windows / macOS / Linux
- Uprawnienia administracyjne do instalacji narzędzi

---

## 🛠️ Narzędzia do zainstalowania

| Narzędzie | Link |
|-----------|------|
| Visual Studio Code | [code.visualstudio.com](https://code.visualstudio.com/) |
| Git | [git-scm.com/install](https://git-scm.com/install/) |
| Azure CLI | [Instrukcja instalacji](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) |

---

## 🔑 Konta

| Serwis | Link |
|--------|------|
| GitHub | [github.com/signup](https://github.com/signup) |
| Azure DevOps | [Rejestracja](https://learn.microsoft.com/en-us/azure/devops/user-guide/sign-up-invite-teammates?view=azure-devops&tabs=microsoft-account#sign-up) |

---

## ☁️ Dostęp do Azure

- Aktywna subskrypcja Azure — może być [bezpłatna](https://azure.microsoft.com/en-us/pricing/free-services)
- Do rejestracji potrzebny adres e-mail (np. [Outlook](https://signup.live.com/?lic=1))
- Podczas aktywacji wymagana karta kredytowa/debetowa do weryfikacji tożsamości — **opłaty nie są naliczane** w ramach darmowych limitów

---

## 🔗 Service Connection / Secret (konfiguracja dostępu CI/CD do Azure)

Przed warsztatem skonfiguruj połączenie między platformą CI/CD a Azure:

- **Azure DevOps** — Service Connection typu Azure Resource Manager
  → [Dokumentacja](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops#create-a-service-connection)

- **GitHub Actions** — OIDC Federation z Azure (bez długożyciowych sekretów)
  → [Instrukcja na blogu JustCloud](https://blog.justcloud.pl/2025/11/20/github-actions-oidc-federation-azure)

---

## ✅ Lista kontrolna przed warsztatem

- [ ] Zainstalowany Visual Studio Code, Git, Azure CLI
- [ ] Aktywne konto GitHub
- [ ] Aktywne konto Azure DevOps
- [ ] Aktywna subskrypcja Azure
- [ ] Skonfigurowany Service Connection (ADO) lub sekrety OIDC (GitHub)