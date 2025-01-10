db.employee.insertMany([{employee_id : '1', employee_name : 'bisesh shrestha', employee_contact_number : '1234567890', employee_department : 'it',
                         employee_email : 'bisesh@gmail.com', employee_website : 'bisesh.np.com'},
                     
                    {employee_id : '2', employee_name : 'Saugat nepal', employee_contact_number : '2345678910', employee_department : 'it',
                         employee_email : 'saugat@gmail.com', employee_website : 'saugat.np.com'},
                     
                    {employee_id : '3', employee_name : 'Sabin Dahal',employee_contact_number : '0123456789', employee_department : 'it',
                         employee_email : 'sabin@gmail.com', employee_website : 'sabin.np.com'}]);
                         

                         
db.department.insertMany([{dept_id : '1', dep_name : 'it', address : 'bhaktapur'},
                     
                    {dept_id : '2', dep_name : 'hr', address : 'kathmandu'}]);
                    
                    
               
                    
db.tax.insertMany([{tax_id : '1', type : 'pf'},
                     
                   {dept_id : '2', type : 'pf'}]);
                   
                   
                   
                   

db.department.insertMany([{dept_id : '1', dep_name : 'it', address : 'bhaktapur'},
                     
                    {dept_id : '2', dep_name : 'hr', address : 'kathmandu'}]);
                    


          
db.salary.insertMany([{salary_id : '1', labour_hour : '8', over_time : '2', total: '10', detail : 'holi fest'},
                      {salary_id : '2', labour_hour : '8', over_time : '2', total: '10', detail : 'tihar fest'},
                      {salary_id : '3', labour_hour : '8', over_time : '2', total: '10', detail : 'deshain fest'},
                      {salary_id : '4', labour_hour : '8', over_time : '2', total: '10', detail : 'losar fest'},
                      {salary_id : '5', labour_hour : '8', over_time : '2', total: '10', detail : 'jatra fest'}]);
                      
        
db.deduction.insertMany([{deduction_id : '1', description : 'deu to absent', amount : '500', detail : 'absent in holi'},
                         {deduction_id : '2', description : 'deu to absent', amount : '500', detail : 'absent in tihar'},
                         {deduction_id : '3', description : 'deu to absent', amount : '500', detail : 'absemt in losar'},
                         {deduction_id : '4', description : 'deu to absent', amount : '500', detail : 'absemt in dashain'},
                         {deduction_id : '5', description : 'deu to absent', amount : '500', detail : 'absemt in jatra'}]);
                         
db.it.insertMany([{it_id : '1', it_name : 'ram', contact_number : '1234567890', department : 'it', email : 'r@gmail.com'},
                  {it_id : '2', it_name : 'shyam', contact_number : '1234567890', department : 'it', email : 's@gmail.com'},
                  {it_id : '3', it_name : 'har', contact_number : '1234567890', department : 'it', email : 'h@gmail.com'}]);
                                 
db.employee.find();
                         
                         
                         
                         
                         
                         
                         
                         
                         
                         
db.employee.remove({});
db.department.remove({});
db.salary.remove({});
db.deduction.remove({});                     
db.it.remove({});
db.tax.remove({});               


db.employee.drop();
db.department.drop();
db.salary.drop();
db.deduction.drop();                     
db.it.drop();
db.tax.drop();               









                         
db.employee.aggregate([
 { $unionWith: "salary" },
 { $unionWith: "department" },
 {
 $group: {
        _id: "$_id",
        salary: { $push: "$detail" },
        department: { $push: "$dep_name" },
        employee: { $push: "$employee_name" }}},
 {$project: {
        _id: 1,
        employee: 1,
        department: 1,
        salary: 1,
    }
 },
 { $unwind: { path: "$employee",preserveNullAndEmptyArrays: true } },
 { $unwind: { path: "$department",preserveNullAndEmptyArrays: true } },
 { $unwind: { path: "$salary", preserveNullAndEmptyArrays:true } },
 { $sort: { _id: 1 } },]);
 
 
 
               
 