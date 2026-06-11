.PHONY: dev

dev:
	npx quartz build --serve

update:
	npx quartz plugin install --latest