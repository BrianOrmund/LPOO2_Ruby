# Esta é a classe para o controller cursos
#
# Cada método dessa classe implementa uma ação do CRUD
# (ou algum suporte a ela).
#
# - index: lista os cursos (R)
# - show: exibe um curso (R)
# - new: instancia um novo curso (C)
# - create: cria o curso instanciado no model (C)
# - edit: exibe o form para editar um curso (U)
# - update: atualiza o curso no model (U)
# - destroy: deleta um curso no model (D)

class CursosController < ApplicationController

    def index
        @cursos = Curso.all
    end

    def show
        @curso = Curso.find(params[:id])
    end

    def new
        @curso = Curso.new
    end

    def create
        @curso = Curso.new(semestre: params[:curso][:semestre], disciplina: params[:curso][:disciplina],
        professor: params[:curso][:professor], aluno: params[:curso][:aluno])

        if @curso.save
            redirect_to @curso
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @curso = Curso.find(params[:id])
    end

    def update
        @curso = Curso.find(params[:id])

        if @curso.update(semestre: params[:curso][:semestre], disciplina: params[:curso][:disciplina],
            professor: params[:curso][:professor], aluno: params[:curso][:aluno])
            redirect_to @curso
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @curso = Curso.find(params[:id])
        @curso.destroy
    
        redirect_to root_path, status: :see_other
    end
end
