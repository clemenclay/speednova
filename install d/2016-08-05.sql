REPLACE INTO `hb_language_locales` (`language_id`,`section`,`keyword`,`value`)
SELECT id, 'emailtemplates', 'generic','Default Notification' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'creditCardChargeFail','Details:CreditCard:ChargeFailed' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ACHChargeFail','Details:ACHCard:ChargeFailed' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ClientProfileAdd','Clients:Add Contact' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'resetPassword','Details:Password Request' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'remindPassword','Details:Password Reset' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ClientAdd','Details:Signup' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'EstimateMail','Estimate' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ClientEdit','Clients:Details Changed' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'UnpaidInvoiceReminder','Invoice:Reminder' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'InvoiceReminder','Invoice:Overdue' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'InvoiceCreated','Invoice:New & CreditNote:New' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'expiringDomain','Domain:Expiring' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'InvoiceFinal','Invoice:Final' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'AddTransaction','New Incoming Transaction' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'InvoicePaid','Invoice:Paid' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'MailClientAfterRefund','Invoice:Refund' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'NewOrder','Order:New' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'TicketImportTimeLimit','Ticket:TimeLimit' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'BounceSupportMail','Ticket:Bounce' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ClientAddedFunds','Clients:Add Funds' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'TicketClosedByClient','Ticket:Closed By Client' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'TicketNotesUpdated','Ticket:Notes Change' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'after_ticketescalate','Ticket:Escalated' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'after_ticketoverdue','Ticket:Escalated (Overdue)' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'NewTicketReply','Ticket:Reply' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'NewTicketByAdmin','Ticket:By Admin' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'TicketSharedNew','Ticket:New (Share)' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'NewTicket','Ticket:New' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'after_order_assign','Admin:Order Ownership' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'after_ticket_assign','Ticket:Assigned' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'AfterModuleTerminate','Account:Terminated' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ProductAccountCreated','Account:Created' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'SuspendAccount','Account:Suspended' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'UnsuspendAccount','Account:Unsuspended' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ClientEmail','Client:Email' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'AfterRegistrarRegistration','Domain:Registered' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'AfterRegistrarTransfer','Domain:Transfer Started' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'AfterRegistrarRenewal','Domain:Renewed' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'DomainEmail','Domain:Email' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'DomainAutomationNotify','Domain:Action' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ProductEmail','Account:Email' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'after_fraudneworder','Order:FraudOrder' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'CancellationRequest','Account:Cancellation Request' FROM hb_language WHERE target!='user'
UNION SELECT id, 'emailtemplates', 'ResetServicePassword','Account:Password Reset' FROM hb_language WHERE target!='user';