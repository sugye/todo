# coding: utf-8

require 'fileutils'
require 'active_record'

module Todo

  # �f�[�^�x�[�X�ւ̐ڑ��������������W���[��
  # @author sugamasao
  module DB

    # �f�[�^�x�[�X�ւ̐ڑ��ƃe�[�u���̍쐬���s��
    # @return [void]
    def self.prepare
      database_path = File.join(ENV['HOME'], '.todo', 'todo.sqlite3')

      connect_database database_path
      create_table_if_not_exists database_path
    end

    # �f�[�^�x�[�X�ւ̐ڑ����s��
    # @param [String] path �ڑ����s���f�[�^�x�[�X�̃p�X
    # @return [void]
    def self.connect_database(path)
      spec = {adapter: 'sqlite3', database: path}
      ActiveRecord::Base.establish_connection spec
    end


    # tasks�e�[�u���̍쐬���s��
    # @param [String] path �ڑ����s���f�[�^�x�[�X�̃p�X
    # @return [void]
    def self.create_table_if_not_exists(path)
      create_database_path path

      connection = ActiveRecord::Base.connection

      return if connection.table_exists?(:tasks)

      connection.create_table :tasks do |t|
        t.column :name,    :string,  null: false
        t.column :content, :text,    null: false
        t.column :status,  :integer, default: 0, null: false
        t.timestamps
      end
      connection.add_index :tasks, :status
      connection.add_index :tasks, :created_at
    end
   

    # �f�[�^�x�[�X�t�@�C���ۑ���̃f�B���N�g�����쐬����
    # @param [String] path �ڑ����s���f�[�^�x�[�X�̃p�X
    # @return [void]
    def self.create_database_path(path)
      FileUtils.mkdir_p File.dirname(path)
    end

    private_class_method :connect_database, :create_table_if_not_exists, :create_database_path
  end

end

