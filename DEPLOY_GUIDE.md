# B2S Success Financial Solutions — Deployment Guide

## Files Structure
```
b2s-success/
├── public/
│   ├── index.html      ← Main website (SPA)
│   ├── logo.png        ← B2S logo
│   └── config.js       ← Supabase credentials (edit this)
├── admin/
│   └── index.html      ← Admin dashboard
└── schema.sql          ← Database setup SQL
```

---

## STEP 1 — Set Up Supabase (Free)

1. Go to https://supabase.com → Sign Up (free)
2. Click **New Project** → name it `b2s-success`
3. Choose region: **Southeast Asia (Singapore)**
4. Set a strong database password, click **Create Project**
5. Wait ~2 minutes for setup
b2spassword@13081980
### Run the SQL Schema
1. In Supabase dashboard → **SQL Editor** → click **New Query**
2. Paste the entire contents of `schema.sql`
3. Click **Run** ✅

### Create Storage Bucket
1. Supabase → **Storage** → **New Bucket**
   - Name: `loan-documents`
   - Public: **OFF** (private)
2. Click the bucket → **Policies** tab → Add these two policies:

**Policy 1** (for public form uploads):
- Name: `Allow public uploads`
- Operation: `INSERT`
- Role: `anon`
- Policy definition: `true`

**Policy 2** (for admin downloads):
- Name: `Admin download`  
- Operation: `SELECT`
- Role: `authenticated`
- Policy definition: `true`

### Get Your Credentials
1. Supabase → **Settings** → **API**
2. Copy:
   - **Project URL** → looks like `https://xyzabc.supabase.co`
   - **anon public key** → long JWT token

---

## STEP 2 — Update config.js

Open `public/config.js` and replace:
```js
const SUPABASE_URL = 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ANON_KEY';
```
With your actual values from Step 1.
https://nevhrentoctvwevdbdsr.supabase.co
sb_publishable_5URVk9mOMX2P3Zfk_jR4CA_WZ5uplVi



NEXT_PUBLIC_SUPABASE_URL=https://nevhrentoctvwevdbdsr.supabase.co
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY=sb_publishable_5URVk9mOMX2P3Zfk_jR4CA_WZ5uplVi

## STEP 3 — Create Admin Login

1. Supabase → **Authentication** → **Users** → **Add User**
2. Email: `b2ssuccess17@gmail.com` (or any email you prefer)
3. Password: Set a strong password
4. This is how Mrs. Brinda's team will log into the admin dashboard

---

## STEP 4 — Deploy to Vercel (Free)

### Option A: Drag & Drop (Easiest)
1. Go to https://vercel.com → Sign Up with GitHub
2. Click **Add New → Project**
3. Choose **"Import Third-Party Git Repository"** or use **Deploy via CLI**

### Option B: Via GitHub (Recommended)
1. Create a GitHub account if you don't have one
2. Create a new repo → upload all files
3. Go to Vercel → **Import** → select your GitHub repo
4. **Root Directory**: leave as `/` (default)
5. Click **Deploy** ✅

### Option C: Vercel CLI
```bash
npm install -g vercel
cd b2s-success
vercel --prod
```

### After Deployment
Your site will be live at: `https://b2s-success.vercel.app`

You can add a custom domain (e.g. `b2ssuccess.in`) in:
Vercel → Your Project → **Settings** → **Domains**

---

## ACCESSING THE ADMIN DASHBOARD

URL: `https://your-site.vercel.app/admin/`

Login with the credentials you created in Step 3.

---

## WHAT EACH SECTION DOES

| Page | URL | Description |
|------|-----|-------------|
| Main Site | `/` | Public-facing SPA with all sections |
| Admin | `/admin/` | Secure admin panel for Mrs. Brinda's team |

### Admin Features
- View all loan applications
- Filter by status, loan type, or search by name/mobile/PAN
- Open full application details in a slide-out drawer
- Download uploaded documents individually
- Update application status (New → Reviewing → Approved/Rejected/Disbursed)
- Dashboard stats (total, new, reviewing, approved)

---

## WHATSAPP INTEGRATION

The WhatsApp number is hardcoded as `+91 81249 04038`.
- Float button opens chat with a pre-filled message
- After form submission, a modal gives the option to continue on WhatsApp
- WhatsApp links are clickable in the About section and footer

To change the number, search for `8124904038` in both HTML files and update.

---

## MAINTENANCE

- All applications are stored in Supabase `loan_applications` table
- All documents are in Supabase Storage `loan-documents` bucket
- View raw data: Supabase → **Table Editor** → `loan_applications`
- Free tier limits: 500MB DB, 1GB storage, 50,000 monthly active users
  (More than enough for this use case)

---

## SUPPORT

For technical help, contact the developer.
For Supabase issues: https://supabase.com/docs
For Vercel issues: https://vercel.com/docs
