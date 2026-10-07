-- One-time setup for short, read-only practice share links.
create table if not exists public.practice_shares (
  share_id text primary key,
  team_id uuid not null,
  payload jsonb not null,
  created_by uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

alter table public.practice_shares enable row level security;

-- Anyone with the random share URL may read that snapshot.
drop policy if exists "Public can read practice shares" on public.practice_shares;
create policy "Public can read practice shares"
on public.practice_shares for select
to anon, authenticated
using (true);

-- Only a signed-in member of the matching team can create a share.
drop policy if exists "Team members can create practice shares" on public.practice_shares;
create policy "Team members can create practice shares"
on public.practice_shares for insert
to authenticated
with check (
  created_by = auth.uid()
  and exists (
    select 1 from public.team_members tm
    where tm.team_id = practice_shares.team_id
      and tm.user_id = auth.uid()
  )
);

-- Creators can remove their own share snapshots later if needed.
drop policy if exists "Creators can delete practice shares" on public.practice_shares;
create policy "Creators can delete practice shares"
on public.practice_shares for delete
to authenticated
using (created_by = auth.uid());

create index if not exists practice_shares_created_at_idx
  on public.practice_shares (created_at desc);
