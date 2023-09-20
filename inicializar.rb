require './aluno'
require './busca_aluno'
require './gerar_email'
require './atualizar_dados'

module Inicializar
  def self.dados_aluno
    puts 'Digite sua matrícula: ' 
    matricula = gets.chomp
    dados_aluno = BuscaAluno.por_matricula(matricula)

    while dados_aluno == nil
      puts 'Matricula inválida, digite novamente: '
      matricula = gets.chomp
      dados_aluno = BuscaAluno.por_matricula(matricula)
      return exit if matricula.empty?
    end
    dados_aluno
  end
  
  def self.aluno(dados_aluno)
    aluno = Aluno.new(dados_aluno)
    if aluno.uffmail
      puts "O aluno(a): #{aluno.nome} já possui uffmail."
      exit
    end

    if aluno.inativo?
      puts "O aluno(a): #{aluno.nome} está inativo."
      puts 'Impossível criar uffmail.'
      exit
    end
    aluno
  end
  
  def self.novo_email(aluno)
    emails = GerarEmail.opcoes(aluno.primeiro_nome, aluno.sobrenome, aluno.matricula)
    puts "#{aluno.primeiro_nome}, por favor escolha uma das opções abaixo para o seu UFFMail:"
    puts 
    emails.each_with_index do |email, index|
      puts "#{index + 1} - #{email}"
    end
    puts
    escolha = gets.chomp.to_i
    while escolha < 1 || escolha > emails.length
      puts 'Digite uma opção válida: '
      escolha = gets.chomp.to_i
    end
    email_escolhido = emails[escolha - 1]
    AtualizarDados.novo_uffmail(email_escolhido, aluno.matricula)
    puts "A criação de seu e-mail (#{email_escolhido}) será feita nos próximos minutos."
    puts "Um SMS foi enviado para #{aluno.telefone} com a sua senha de acesso."
  end
end

