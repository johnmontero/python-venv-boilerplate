.DEFAULT_GOAL := help

## GENERAL ##
APP_DIR         = "app"
VENV_DIR        = "venv"

## RESULT_VARS ##
PROJECT_NAME    = "python-venv-boilerplate"
CONTAINER_NAME  = ${PROJECT_NAME}_backend
IMAGE_DEV       = ${PROJECT_NAME}:dev


##################################################################
#### Development Commands
##################################################################

ssh: ## Conectar al container por el protocolo ssh
	docker container run --workdir "/${APP_DIR}" --rm -it -v "${PWD}/${VENV_DIR}":/${VENV_DIR} -v "${PWD}/${APP_DIR}":/${APP_DIR} ${IMAGE_DEV} "/bin/zsh"

build: ## Construir imagen para development
	docker build -f docker/dev/Dockerfile -t $(IMAGE_DEV) docker/dev/ --no-cache

venv-create: ## Crea el entorno virtual (virtualenv)
	docker container run --workdir "/${APP_DIR}" --rm -it -v "${PWD}/${VENV_DIR}":/${VENV_DIR} -v "${PWD}/${APP_DIR}":/${APP_DIR} --tty=false ${IMAGE_DEV}  virtualenv /${VENV_DIR}

venv-install-lib: ## Instala las librerias en el entorno virtual (virtualenv)
	docker container run --workdir "/${APP_DIR}" --rm -it -v "${PWD}/${VENV_DIR}":/${VENV_DIR} -v "${PWD}/${APP_DIR}":/${APP_DIR} --tty=false ${IMAGE_DEV}  "/${VENV_DIR}/bin/pip" install -r requirements.txt


###### Help
help:
	@grep -E '^[a-zA-Z_-]+.+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'
	@echo
