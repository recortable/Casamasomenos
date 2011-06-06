# encoding: utf-8
# DSL: http://4loc.wordpress.com/2009/05/29/dsl-in-ruby/

require 'lorem'

User.create!(:name => 'Admin', :email => 'admin@casamasomenos.net', :rol => 'admin')
User.create!(:name => 'Anonymous', :email => 'anonymous@casamasomenos.net', :rol => 'anonymous')
User.create!(:name => 'Danigb', :email => 'danigb@gmail.com', :rol => 'admin')

BODY = Lorem::Base.new('paragraphs', 10).output

class ArticleBuilder
  def initialize(parent_id = nil)
    @parent_id = parent_id
  end

  def article(title, &block)
    article = Article.create!(:title => title, :body => BODY, :author_id => 1, :parent_id => @parent_id)
    if block_given?
      builder = ArticleBuilder.new(article.id)
      builder.instance_eval &block
    end
  end
end

builder = ArticleBuilder.new

builder.article('Casa más o menos') do

  article('Presentación') do
    article('Introducción')
    article('Objeto de estudio')
    article('Justificación')
    article('Base teórica conceptual') do
      article('Marco teórico')
      article('Marco referencial')
      article('Marco conceptual')
    end
  end

  article('Mapa de metodologías y modelos para viviendas en proceso') do
    article('Modelos de organización, tenencia y gestión') do
      article('Organización') do
        article('Individual')
        article('Colectiva') do
          article('Comunidades de vecinos')
          article('Cooperativa')
          article('Co-housing')
        end
      end

      article('Tenencia') do
        article('Propiedad privada') do
          article('Individual')
          article('Colectiva') do
            article('Cooperativa')
          end
        end
      end
      article('Gestión') do
        article('Privada') do
          article('Autogestión') do
            article('Individual')
            article('Colectiva') do
              article('Comunidad de vecinos')
            end
          end
          article('Gestión promotor/usuario')
          article('Gestión externa') do
            article('Empresas gestión habitar')
            article('Administradores de fincas')
            article('Sociedades gestoras de cooperativas')
          end
        end
        article('Pública') do
          article('Empresas públicas de gestión habitar')
        end
      end
    end


    article('Modelos tipológicos') do
      article('Viviendas en proceso') do
        article('Vivienda cualitativa') do
          article('Vivienda perfectible')
        end
        article('Vivienda flexible') do
          article('Vivienda loft')
          article('Vivienda desjerarquizada')
          article('Vivienda transformable')
        end
        article('Vivienda elástica') do
          article('Vivienda estructura receptora')
          article('Vivienda ampliable')
          article('Vivienda ampliable por módulos')
          article('Vivienda galpón')
          article('Vivienda semilla')
          article('Vivienda dispersa')
          article('Vivienda divisible')
        end
      end
      article('Vivienda colectiva en proceso')
    end

  end

  article('Medios que posibilitan viviendas en proceso') do
    builder.article('Estrategias para posibilitar otros modelos de organización')
    builder.article('Estrategias para proporcionar adaptabilidad')
  end

  article('Recursos') do
    article('Experiencias previas')
    article('Referencias')
  end
end
