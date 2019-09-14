require_relative 'questions_database'

class Reply
  attr_accessor :body, :subject_question_id, :user_id, :parent_reply_id
  
  def self.find_by_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        replies
      WHERE
        user_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @body = options['body']
    @subject_question_id = options['subject_question_id']
    @user_id = options['user_id']
    @parent_reply_id = options['parent_reply_id']
  end
  
end