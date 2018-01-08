class OrderObserber < ActiveRecord::Observer
def after_save(an_order)
	an_order.logger.info("#{an_order.id}")
end
end

class AuditObserver < AcriveRecord::Observer
observer Order, Payment, Refund

def after_save[model]
	model.logger.info("[Audit] #{model.class.name} #{model.id}")
end
end

OrderOberber.instance
AuditObserver.instance

