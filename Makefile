STACK_NAME ?= "factorio"

roll-stack: stack.json
	$(MAKE) create-stack || $(MAKE) update-stack

create-stack:
	aws cloudformation create-stack \
		--stack-name $(STACK_NAME) \
		--template-body file://$${PWD}/stack.json

update-stack:
	aws cloudformation update-stack \
		--stack-name $(STACK_NAME) \
		--template-body file://$${PWD}/stack.json

stack.json: stack.cfndsl.rb stack.yml
	bundle exec cfndsl stack.cfndsl.rb -p -y stack.yml > stack.json

