class TransactionPdf <  Prawn::Document

   def initialize(transaction)

     super(top_margin: 50)
     @transaction = transaction

     text "MagisCoin \n\n", size: 25, style: :bold, align: :center

     text "Transactions", size: 20
     line_items

   end

   def line_items
       move_down 20
       table line_item_rows

   end

  def line_item_rows
    [["Sender", "Receiver", "Card Number", "Purchase Type", "Amount", "Time Recorded"]] +
     @transaction.each.map do |transaction|
      [
        if User.find(transaction.send_id).f_name != nil
          User.find(transaction.send_id).f_name +  " " + User.find(transaction.send_id).l_name
        else
          User.find(transaction.send_id).merchant_name
        end,
        if User.find(transaction.recv_id).f_name != nil
          User.find(transaction.recv_id).f_name  +  " " + User.find(transaction.recv_id).l_name
        else
          User.find(transaction.recv_id).merchant_name
        end,
        transaction.card_id,
        transaction.purchase_type,
        transaction.amount,
        transaction.time_recorded.to_s
      ]
    end
  end
end
