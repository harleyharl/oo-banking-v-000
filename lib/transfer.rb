class Transfer

  attr_accessor :receiver, :amount
  attr_reader :sender, :status

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @status = "pending"
  end

  def valid?
    if @status != "complete"
    @sender.valid? && @receiver.valid?
    end
  end

  def execute_transaction
      if self.valid? && @sender.balance > @amount
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
      elsif
        self.valid? && @sender.balance < @amount
        @status = "Transaction rejected. Please check your account balance."
      else
        @status = "rejected."
      end
   end

  def reverse_transfer
  end
end
