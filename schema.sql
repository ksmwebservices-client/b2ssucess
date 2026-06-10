-- ─────────────────────────────────────────────────────────────────────────
-- B2S SUCCESS FINANCIAL SOLUTIONS — Supabase Database Schema
-- Run this in Supabase SQL Editor: https://supabase.com/dashboard/project/_/sql
-- ─────────────────────────────────────────────────────────────────────────

-- 1. LOAN APPLICATIONS TABLE
create table if not exists loan_applications (
  id               uuid primary key default gen_random_uuid(),
  created_at       timestamptz default now(),

  -- Loan Details
  loan_type        text not null,
  loan_amount      numeric,
  tenure           integer,
  purpose          text,

  -- Personal
  name             text not null,
  dob              date,
  mobile           text not null,
  alt_mobile       text,
  aadhaar          text,
  pan              text,
  email_official   text,
  email_personal   text,
  father_name      text,
  mother_name      text,
  spouse_name      text,
  spouse_dob       date,
  landline         text,
  qualifications   text,

  -- Address
  home_address     text,
  home_landmark    text,
  resi_type        text,
  resi_duration    text,

  -- Employment
  company_name     text,
  company_address  text,
  company_phone    text,
  company_landmark text,
  designation      text,
  salary_gross     numeric,
  salary_takehome  numeric,
  exp_current      text,
  exp_total        text,

  -- References
  ref1_name        text,
  ref1_number      text,
  ref1_address     text,
  ref1_relation    text,
  ref2_name        text,
  ref2_number      text,
  ref2_address     text,
  ref2_relation    text,

  -- Nominee
  nominee_name     text,
  nominee_dob      date,
  nominee_relation text,

  -- Existing Loan
  existing_lender       text,
  existing_loan_type    text,
  existing_outstanding  numeric,
  existing_emi          numeric,

  -- Admin
  status           text default 'New',
  admin_notes      text
);

-- 2. LOAN DOCUMENTS TABLE
create table if not exists loan_documents (
  id               uuid primary key default gen_random_uuid(),
  created_at       timestamptz default now(),
  application_id   uuid references loan_applications(id) on delete cascade,
  doc_label        text,
  file_name        text,
  storage_path     text
);

-- ─────────────────────────────────────────────────────────────────────────
-- ROW LEVEL SECURITY (RLS)
-- ─────────────────────────────────────────────────────────────────────────

-- Enable RLS
alter table loan_applications enable row level security;
alter table loan_documents enable row level security;

-- Allow anyone (anon) to INSERT applications (public form)
create policy "Anyone can insert applications"
  on loan_applications for insert to anon with check (true);

create policy "Anyone can insert documents"
  on loan_documents for insert to anon with check (true);

-- Only authenticated users (admin) can SELECT / UPDATE
create policy "Admins can read applications"
  on loan_applications for select to authenticated using (true);

create policy "Admins can update applications"
  on loan_applications for update to authenticated using (true);

create policy "Admins can read documents"
  on loan_documents for select to authenticated using (true);

-- ─────────────────────────────────────────────────────────────────────────
-- STORAGE BUCKET SETUP
-- In Supabase Dashboard → Storage → New Bucket
--   Name: loan-documents
--   Public: NO (private)
-- Then add these policies in Storage → loan-documents → Policies:
--
-- Policy 1 (INSERT for anon):
--   Name: Allow public uploads
--   Operation: INSERT
--   Role: anon
--   Definition: true
--
-- Policy 2 (SELECT/DOWNLOAD for authenticated):
--   Name: Admin download
--   Operation: SELECT
--   Role: authenticated
--   Definition: true
-- ─────────────────────────────────────────────────────────────────────────
