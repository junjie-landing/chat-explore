.PHONY: dev setup db-push db-studio supabase-migration supabase-push supabase-generate

install:
	npm install
	npm install @supabase/supabase-js

dev:
	npm run dev

setup:
	npm install
	supabase init --force
	supabase start || (supabase stop && supabase start)
	npm run prisma:generate
	npm run prisma:push

clean:
	supabase stop
	rm -rf supabase/config.toml

reset: clean setup

db-push:
	npx prisma db push

db-studio:
	npx prisma studio

supabase-start:
	supabase start || (supabase stop && supabase start)

supabase-stop:
	supabase stop

supabase-status:
	supabase status

supabase-migration:
	npx prisma migrate dev --name init

supabase-push:
	npx prisma db push

supabase-generate:
	npx prisma generate
