# encoding: utf-8
# DSL: http://4loc.wordpress.com/2009/05/29/dsl-in-ruby/

User.create!(:name => 'Admin', :email => 'super@casamasomenos.net', :rol => 'admin')
User.create!(:name => 'Anonymous', :email => 'anonymous@casamasomenos.net', :rol => 'anonymous')
User.create!(:name => 'Danigb', :email => 'danigb@gmail.com', :rol => 'admin')


class ArticleBuilder
  def initialize(parent_id = nil)
    @parent_id = parent_id
  end

  def article(title, &block)
    parent = create(:name => title, :body => 'De momento no hay contenido para este artículo', :author_id => 1, :parent_id => @parent_id)
    builder = ArticleBuilder.new(parent.id)
    builder.instance_eval &block if block_given?
  end

  def create(params)
    Article.create!(params)
  end
end

builder = ArticleBuilder.new
builder.article('Mapa de posibilidades') do
  article('Modelos de organización y gestión') do
    article('Cooperativa')
    article('Cooperativa por ayuda mútua')
    article('Co-housing')
    article('Ocupación')
    article('Auto-construcción')
    article('Empresa de gestión de hábitat')
  end

  article('Estrategias tipológicas') do
    article('Tipologías de agrupación') do
      article('Vivienda progresiva') do
        article('Vivienda progresiva adaptable') do
          article('Vivienda jerarquizada')
          article('Vivienda transformable')
          article('Vivienda divisible')
          article('Vivienda loft')
        end
        article('Vivienda progresiva elástica') do
          article('Vivienda dispersa')
          article('Vivienda receptora')
          article('Vivienda Galpón')
          article('Vivienda Semilla')
          article('Vivienda ampliable')
          article('Vivienda ampliable por módulos')
          article('Vivienda colectiva')
        end
        article('Vivienda progresiva cualitativa') do
          article('Vivienda perfectible')
          article('Mejoramientos')
        end
      end
      article('Vivienda reciclada')
      article('Vivienda obra nueva')
    end
  end

  article('Métodos de diseño colaborativo') do
    article('Programa generador de viviendas')
    article('Máquina de escribir viviendas')
    article('Método soportes')
    article('Lenguaje de patrones')
    article('Open source housing')
    article('Procesamiento no convencional')
    article('Sistema pared profunda')
    article('Método Livinstong')
    article('Bar-code house system')
  end
end

