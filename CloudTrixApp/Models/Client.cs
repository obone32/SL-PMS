using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;

namespace CloudTrixApp.Models
{
    [Table("Client")]
    public class Client
    {
        [Key]
        [Column(Order = 0)]
        [Required]
        [Display(Name = "Client I D")]
        public Int32 ClientID { get; set; }

        [Required]
        [StringLength(8000)]
        [Display(Name = "Client Name")]
        public String ClientName { get; set; }

        [StringLength(8000)]
        [Display(Name = "Address1")]
        public String Address1 { get; set; }

        [StringLength(8000)]
        [Display(Name = "Address2")]
        public String Address2 { get; set; }

        [StringLength(8000)]
        [Display(Name = "City")]
        public String City { get; set; }

        [StringLength(8000)]
        [Display(Name = "District")]
        public String District { get; set; }

        [StringLength(8000)]
        [Display(Name = "State")]
        public String State { get; set; }

        [StringLength(8000)]
        [Display(Name = "Pin Code")]
        public String PinCode { get; set; }

        [StringLength(8000)]
        [Display(Name = "Contact No")]
        public String ContactNo { get; set; }

        [StringLength(8000)]
        [Display(Name = "E Mail")]
        public String EMail { get; set; }

        [StringLength(8000)]
        [Display(Name = "G S T I N")]
        public String GSTIN { get; set; }

        [Required]
        [Display(Name = "Company I D")]
        public Int32 CompanyID { get; set; }

        [Required]
        [Display(Name = "Add User I D")]
        public Int32 AddUserID { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Add Date")]
        public DateTime AddDate { get; set; }

        [Display(Name = "Archive User I D")]
        public Int32? ArchiveUserID { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Archive Date")]
        public DateTime? ArchiveDate { get; set; }

        public bool IsStateMatch { get; set; }
        // ComboBox
        public virtual Company Company { get; set; }

    }
}
 
