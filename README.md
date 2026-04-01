# DevOps & CI/CD: Fundamenty Enterprise

Darmowy warsztat online (Q1 2026) – JustCloud.pl

🎓 **100% praktyki, zero slajdów** | Live Coding + Q&A
---

### Co się nauczysz?

- ✅ **Azure DevOps Pipelines** - struktura pipeline'ów: stages, jobs, steps, triggers
- ✅ **Service Connection** - uwierzytelnianie z Azure via App Registration (OIDC)
- ✅ **Terraform w CI/CD** - `init → plan → apply` w pipeline, artefakty z planem
- ✅ **Reusable Templates** - modularne szablony pipeline (`template:`) dla plan i apply
- ✅ **Bicep w CI/CD** - `what-if → deploy` w pipeline na scope subskrypcji
- ✅ **Stage Deployments** - wielośrodowiskowe wdrożenia (dev/test/prod) z artefaktami
- ✅ **Environments & Approvals** - gate przed wdrożeniem na środowisko (manual approval)
- ✅ **100% praktyki** - zero slajdów, live coding w VS Code + Azure DevOps

### Dla kogo?

- ✅ Masz podstawy Azure (Resource Groups, concepts) i chcesz zautomatyzować wdrożenia
- ✅ Znasz podstawy Terraform lub Bicep i chcesz wpiąć je w pipeline
- ✅ Pracujesz w zespole i szukasz standardów dla CI/CD w Azure
- ✅ Chcesz zrozumieć różnicę między Azure DevOps Pipelines a GitHub Actions
- ✅ Chcesz wdrażać infrastrukturę bezpiecznie z approval gates
- ❌ Dopiero zaczynasz z Azure (zacznij od [Azure Learn](https://learn.microsoft.com/azure/))
- ❌ Nie znasz podstaw Terraform ani Bicep (zacznij od [warsztat-terraform](https://web.justcloud.pl/warsztat-terraform-styczen-2026.html) lub [warsztat-bicep](https://web.justcloud.pl/warsztat-bicep-luty-2026.html))


## ✅ Zadania do wykonania

### 🔐 Step 0 — Konfiguracja dostępu do Azure
- Utwórz Service Connection w Azure DevOps (`Project Settings → Service Connections → Azure Resource Manager`)
- Wybierz App Registration i nadaj dostęp do subskrypcji
- Zapamiętaj nazwę Service Connection — będzie używana we wszystkich pipeline'ach

### 👋 Step 1 — Hello World Pipeline
- Utwórz pipeline wyzwalany zmianą w `.pipelines/step-1.yml`
- Dodaj task **PowerShell** wyświetlający `Hello World`
- Dodaj task **Azure CLI** wyświetlający listę zasobów w subskrypcji (`az resource list`)

### 🌱 Step 2 — Terraform: single job
- Utwórz jeden plik pipeline wyzwalany zmianą w folderze `step-2/`
- Pipeline wykonuje kolejno: `terraform init` → `terraform plan` → `terraform apply`
- Użyj Service Connection do uwierzytelnienia z Azure

### 🔀 Step 3 — Terraform: plan + apply (reusable templates)
- Utwórz trzy pliki pipeline:
  - `step-3.yml` — główny, definiuje parametry i wywołuje szablony
  - `step-3-plan.yml` — szablon: init + plan + publikacja artefaktu z planem
  - `step-3-apply.yml` — szablon: pobranie artefaktu + init + apply
- Stage `apply` uruchamia się tylko po pomyślnym `plan`

### 🦾 Step 4 — Bicep: single job (subscription scope) ⭐ bonus
- Utwórz jeden plik pipeline wyzwalany zmianą w folderze `step-4/`
- Pipeline wykonuje kolejno: `az deployment sub what-if` → `az deployment sub create`
- Użyj pliku parametrów `main.dev.bicepparam`

### 🔀 Step 5 — Bicep: whatif + deploy (reusable templates) ⭐ bonus
- Utwórz trzy pliki pipeline:
  - `step-5.yml` — główny, definiuje parametry i wywołuje szablony
  - `step-5-whatif.yml` — szablon: `az deployment sub what-if`
  - `step-5-deploy.yml` — szablon: `az deployment sub create`
- Stage `deploy` uruchamia się tylko po pomyślnym `whatif`

### 🛡️ Step 6 — Environments + Approvals (gate)
- W Azure DevOps utwórz Environment (`Pipelines → Environments`) dla środowiska `dev`
- Dodaj **Approval** z reviewerem przed wykonaniem stage `apply` / `deploy`
- Zaktualizuj pipeline step-3 i step-5 aby używały skonfigurowanego Environment

---

## 🗺️ Mapa warsztatu

```
╔══════════════════════════════════════════════════════════════════════════════════╗
║                          WARSZTAT – CI/CD NA AZURE                               ║
║                   Azure DevOps Pipelines  vs  GitHub Actions                     ║
╚══════════════════════════════════════════════════════════════════════════════════╝

              AZURE DEVOPS                              GITHUB ACTIONS
         ══════════════════════                    ══════════════════════
       
         ┌─────────────────────┐                   ┌─────────────────────┐
         │  STEP 0             │                   │  STEP 0             │
         │  Service Connection │◄──── TO SAMO ────►│  Repository Secret  │
         │                     │                   │                     │
         │  Project Settings   │                   │  Settings →         │
         │  → Service Conn.    │                   │  Secrets → Actions  │
         │  → Azure RM         │                   │                     │
         │  → App Registration │                   │  AZURE_CREDENTIALS  │
         │                     │                   │  AZURE_SUBSCRIPTION │
         │  serviceConnection: │                   │  AZURE_TENANT_ID    │
         │  'warsztat-2026'    │                   │  AZURE_CLIENT_ID    │
         │                     │                   │  AZURE_CLIENT_SECRET│
         └─────────────────────┘                   └─────────────────────┘
                   │                                         │
                   ▼                                         ▼
         ┌─────────────────────┐                   ┌─────────────────────┐
         │  STEP 1             │                   │  STEP 1             │
         │  Hello World        │◄──── TO SAMO ────►│  Hello World        │
         │  Pipeline trigger   │                   │  Workflow trigger   │
         └─────────────────────┘                   └─────────────────────┘
                   │                                         │
                   ▼                                         ▼
         ┌─────────────────────┐                   ┌─────────────────────┐
         │  STEP 2             │                   │  STEP 2             │
         │  Terraform deploy   │◄──── TO SAMO ────►│  Terraform deploy   │
         │  single job         │                   │  single job         │
         │  [ init→plan→apply ]│                   │  [ init→plan→apply ]│
         └─────────────────────┘                   └─────────────────────┘
                   │                                         │
                   ▼                                         ▼
         ┌─────────────────────┐                   ┌─────────────────────┐
         │  STEP 3             │                   │  STEP 3             │
         │  Terraform          │◄──── TO SAMO ────►│  Terraform          │
         │  ┌───────────────┐  │                   │  ┌───────────────┐  │
         │  │ STAGE: plan   │  │                   │  │  JOB: plan    │  │
         │  │  → artifact   │  │                   │  │  → artifact   │  │
         │  └──────┬────────┘  │                   │  └──────┬────────┘  │
         │         │ [gate?]   │                   │         │ [gate?]   │
         │  ┌──────▼────────┐  │                   │  ┌──────▼────────┐  │
         │  │ STAGE: apply  │  │                   │  │  JOB: apply   │  │
         │  └───────────────┘  │                   │  └───────────────┘  │
         └─────────────────────┘                   └─────────────────────┘
                   │                                         │
                   ▼                                         ▼
         ┌─────────────────────┐                   ┌─────────────────────┐
         │  STEP 4  ★ bonus    │                   │  STEP 4  ★ bonus    │
         │  Bicep deploy       │◄──── TO SAMO ────►│  Bicep deploy       │
         │  subscription scope │                   │  subscription scope │
         │  [ what-if→deploy ] │                   │  [ what-if→deploy ] │
         └─────────────────────┘                   └─────────────────────┘
                   │                                         │
                   ▼                                         ▼
         ┌─────────────────────┐                   ┌─────────────────────┐
         │  STEP 5  ★ bonus    │                   │  STEP 5  ★ bonus    │
         │  Bicep              │◄──── TO SAMO ────►│  Bicep              │
         │  ┌───────────────┐  │                   │  ┌───────────────┐  │
         │  │ STAGE: whatif │  │                   │  │  JOB: whatif  │  │
         │  └──────┬────────┘  │                   │  └──────┬────────┘  │
         │  ┌──────▼────────┐  │                   │  ┌──────▼────────┐  │
         │  │ STAGE: deploy │  │                   │  │  JOB: deploy  │  │
         │  └───────────────┘  │                   │  └───────────────┘  │
         └─────────────────────┘                   └─────────────────────┘
                   │                                         │
                   └──────────────────┬──────────────────────┘
                                      ▼
                        ┌─────────────────────────────┐
                        │         AZURE               │
                        │  Resource Group             │
                        │  Storage Account            │
                        │  Virtual Network            │
                        └─────────────────────────────┘

────────────────────────────────────────────────────────────────────────────────────
  KLUCZOWE RÓŻNICE

  ADO                              GitHub Actions
  ──────────────────────           ──────────────────────
  stages / jobs / steps            jobs / steps
  template: plik.yml               uses: ./.github/workflows/plik.yml
  Service Connection               AZURE_CREDENTIALS (secret)
  OIDC (AzureCLI@2)                azure/login@v2
  Environments → Approvals         Environments → Required reviewers

────────────────────────────────────────────────────────────────────────────────────
  CO WARTO DODAĆ W PRODUKCJI                              ★ HIGHLIGHTS

  ⚠  Terraform w warsztatach używa LOCAL state
     → produkcja wymaga remote backend (Azure Blob Storage + locking)

  ⚠  Jedno SPN dla wszystkich środowisk to zły pomysł
     → dev / test / prod powinny mieć oddzielne Service Connections
        i oddzielne App Registrations z osobnymi uprawnieniami

  ✦  Zamiast checkout kodu w każdym jobie można zbudować artifact
     (build) i przekazywać go między stagami / jobami
     → szybciej, deterministycznie, ten sam kod na plan i apply

  ✦  Wyniki plan / what-if można pokazać bezpośrednio w UI:
     ADO  → Terraform Plan Visualizer (Marketplace Extension)
     GH   → $GITHUB_STEP_SUMMARY (markdown w podsumowaniu runu)

────────────────────────────────────────────────────────────────────────────────────
```

---

## 👨‍🏫 Prowadzący

**Piotr Rogala**  
Principal Cloud Architect @ Nordcloud | Microsoft MVP | MCT

Pomagam klientom w transformacji cyfrowej i optymalizacji architektur Azure. Pasjonuję się automation, security i dzieleniem się wiedzą poprzez warsztaty, konferencje i społeczność tech.

🔗 [Twitter](https://x.com/RogalaPiotr) | [LinkedIn](https://www.linkedin.com/in/rogalapiotr/) | [Blog](https://blog.justcloud.pl/)

---

## 📢 JustCloud.pl

Warsztaty i szkolenia cloud dla profesjonalistów. Cykl darmowych spotkań online dla inżynierów, którzy chcą wejść na wyższy poziom.

🔗 [Warsztaty](https://web.justcloud.pl/warsztaty-darmowe.html) | [Blog](https://blog.justcloud.pl/) | [☕ Buy Coffee](https://buycoffee.to/justcloud)

---

## 🆘 Wsparcie

- 📧 Issues w tym repo
- 💬 Discord JustCloud (dostęp po warsztacie)
- 📝 [Blog JustCloud](https://blog.justcloud.pl/)

---

## 📄 Licencja

Materiały warsztatowe są dostępne na licencji MIT.

---

**Miłego warsztatu! 🚀**
