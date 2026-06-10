// ─── SUPABASE CONFIG ─────────────────────────────────────────────────────────
// Replace these with your actual Supabase project URL and anon key after setup
const SUPABASE_URL = 'https://nevhrentoctvwevdbdsr.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_5URVk9mOMX2P3Zfk_jR4CA_WZ5uplVi';

// Import supabase client (loaded via CDN in HTML)
let supabaseClient;
function initSupabase() {
  supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  return supabaseClient;
}
