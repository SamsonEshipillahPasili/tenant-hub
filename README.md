# TenantHub

TenantHub is a multi-tenant web app used by rental property owners to manage their rental units.

The app has 4 actors.
  - Organization
  - The admin
  - The caretaker.
  - The tenants

## Users & Roles
### Organization
All users are scoped to an organization. 

### The admin
An organization can have more than one admin. There are two types of admin users:-
- Super-user admins
- Regular admins

#### Super-user admins
They are the most powerful user in the organization. In addition to the tasks a regular admin do, 
super-users can also manage admin users.

A super-user can add, delete, update or view regular admins.

#### Regular admins
Regular admins perform administrative duties for the organization.
An admin is attached to a rental property. An admin user can administer more than one rental property.

These tasks include:-

- Onboard tenants into rental properties.
- Onboard caretakers.
- Address tenant tickets (repairs, complaints, suggestions and so on.)
- Create invoices for tenants.
- Generate reports.
- Talk directly to tenants, caretakers via chat (reminders, follow-ups e.t.c)

### The Caretaker
The care-taker physically represents the administration in the premises.
They physically:-
  - Verify tickets are connected to valid issues. Once validated, they escalate the issue to the administrator with more
    information if applicable.
  - Physically onboard the tenant to the premises.
  - Sign off on resolved tickets e.g Repairs e.t.c

## Important Workflows

### The tenant onboarding workflow
- The potential tenant expresses interest in the premise.
- The caretaker shows the potential tenant the units available for renting.
- The caretaker then fills an Expression of Interest form for the client.
  The form captures client essential client details such as ID number, full names e.t.c
- The caretaker forwards the form to an administrator. The administrator may forward it to another admin of the 
  same organization.
- The admin accepts the the EOI, and creates a lease in the "Created" state.
- The admin creates an invoice on the lease for the security deposit + attorney fees.
- The tenant pays, and updates the invoice with the transaction ID.
- The admin approves the invoice, and then creates the Tenancy Onboarding Form.
- The form will capture:-
  - Whether the security deposit has been paid. (attach bank receipt / Mobile money message)
  - Whether the tenant has agreed to T&Cs.(Attach signed copy)
  - Whether the tenant has paid the attorney fees. (Attach signed copy of legal document)
- Once filled, the lease will be activated.
- A copy of the lease is sent (PDF) to the tenant.

### The tenant Rent Payment workflow
- The system generates an invoice at the end of the month. (An admin can create the invoice as well)
- The tenant pays with a mobile provider. 
- The tenant pays the invoice by attaching a mobile money message.
- The invoice transitions to pending.
- The admin reviews and approves (paid/partially paid)/rejects the payment.

### The tenant ticket resolution workflow

- The tenant logs an issue / ticket with the caretaker.
- The caretaker verifies the issue physically (if applicable)
- The caretaker escalates the ticket to an administrator.
- The admin resolves the issue (assigns a repair person e.t.c) 
- The admin invoices the tenant (if applicable e.g due to the tenant's negligence)
- The caretaker verifies the issue has been resolved physically (if applicable)
- The admin closes the issue. 

### The tenant checkout workflow

- The tenant issues a Lease Termination Notice to the caretaker.
- The caretaker collects any required info about the rental unit e.g damages.
- The caretaker escalates the notice to an available admin with extra info.
- The admin prepares a final invoice (if applicable, e.g. late notice penalty, damages, deductible from the security deposit)
- The admin sends a notice for disbursement (when the remaining balance will be disbursed)
- The admin marks the lease as awaiting Refund.
- Once payment is through, the lease moves to "Terminated".

