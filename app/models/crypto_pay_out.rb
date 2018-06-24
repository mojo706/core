# == Schema Information
#
# Table name: crypto_pay_outs
#
#  id                  :bigint(8)        not null, primary key
#  issue_id            :bigint(8)
#  person_id           :bigint(8)
#  type                :string(255)      not null
#  state               :string(255)
#  receiver_address    :string
#  funder_acct_address :string
#  fee_percent         :decimal(, )
#  fee                 :jsonb
#  fees_acct_address   :string
#  amount              :jsonb
#  sent_at             :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_crypto_pay_outs_on_issue_id   (issue_id) UNIQUE
#  index_crypto_pay_outs_on_person_id  (person_id)
#  index_crypto_pay_outs_on_sent_at    (sent_at)
#  index_crypto_pay_outs_on_state      (state)
#  index_crypto_pay_outs_on_type       (type)
#

class CryptoPayOut < ApplicationRecord
  has_many :crypto_pay_out_txns

  belongs_to :issue
  belongs_to :person

  enum state: { pending: 0, sent: 10 }
end
