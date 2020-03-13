# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_312_063_816) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'carts', force: :cascade do |t|
    t.boolean 'status', default: true
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_carts_on_user_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'category_name'
    t.string 'cat_type'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'image_info_id'
    t.index ['image_info_id'], name: 'index_comments_on_image_info_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'image_infos', force: :cascade do |t|
    t.string 'img_name'
    t.string 'img_type'
    t.text 'description'
    t.integer 'price'
    t.integer 'tag_id'
    t.integer 'user_id'
    t.integer 'sub_category_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['sub_category_id'], name: 'index_image_infos_on_sub_category_id'
    t.index ['tag_id'], name: 'index_image_infos_on_tag_id'
    t.index ['user_id'], name: 'index_image_infos_on_user_id'
  end

  create_table 'invoices', force: :cascade do |t|
    t.datetime 'date'
    t.integer 'total_amount'
    t.integer 'order_id'
    t.integer 'payment_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_invoices_on_order_id'
    t.index ['payment_id'], name: 'index_invoices_on_payment_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'image_info_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['image_info_id'], name: 'index_likes_on_image_info_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'line_items', force: :cascade do |t|
    t.integer 'image_info_id', null: false
    t.integer 'cart_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'quantity', default: 1
    t.index ['cart_id'], name: 'index_line_items_on_cart_id'
    t.index ['image_info_id'], name: 'index_line_items_on_image_info_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'image_price'
    t.string 'total_items'
    t.integer 'user_id'
    t.integer 'image_info_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['image_info_id'], name: 'index_orders_on_image_info_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'payments', force: :cascade do |t|
    t.string 'payment_mode'
    t.integer 'user_id'
    t.integer 'order_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_payments_on_order_id'
    t.index ['user_id'], name: 'index_payments_on_user_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.integer 'resource_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index ['name'], name: 'index_roles_on_name'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource_type_and_resource_id'
  end

  create_table 'sub_categories', force: :cascade do |t|
    t.string 'sub_category_name'
    t.integer 'category_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_sub_categories_on_category_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'keyword'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'firstname'
    t.string 'lastname'
    t.bigint 'phone'
    t.string 'country'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'carts', 'users'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'image_infos', 'sub_categories'
  add_foreign_key 'image_infos', 'tags'
  add_foreign_key 'image_infos', 'users'
  add_foreign_key 'invoices', 'orders'
  add_foreign_key 'invoices', 'payments'
  add_foreign_key 'likes', 'image_infos'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'line_items', 'carts'
  add_foreign_key 'line_items', 'image_infos'
  add_foreign_key 'orders', 'image_infos'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'payments', 'orders'
  add_foreign_key 'payments', 'users'
  add_foreign_key 'sub_categories', 'categories'
end
