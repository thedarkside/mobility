module Mobility
  module Test
    class Schema < ::ActiveRecord::Migration[[::ActiveRecord::VERSION::MAJOR, ::ActiveRecord::VERSION::MINOR].join(".")]
      class << self
        def up
          create_table "posts" do |t|
            t.boolean :published
          end

          create_table "fallback_posts" do |t|
            t.boolean :published
          end

          create_table "articles" do |t|
            t.string :slug
          end

          create_table "mobility_translations" do |t|
            t.string  :locale,            null: false
            t.string  :key,               null: false
            t.text    :value,             null: false
            t.integer :translatable_id,   null: false
            t.string  :translatable_type, null: false
          end
          add_index :mobility_translations, [:translatable_id, :translatable_type, :locale, :key], unique: true, name: :index_mobility_translations_on_keys
          add_index :mobility_translations, [:translatable_id, :translatable_type], name: :index_mobility_translations_on_translatable

          create_table "comments" do |t|
            t.text :content_en
            t.text :content_ja
            t.text :content_pt_br
            t.text :content_ru
          end
        end
      end
    end
  end
end