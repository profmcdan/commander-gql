using System;
using System.ComponentModel.DataAnnotations;

namespace CommanderGQL.Models
{
    public class Platform
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();
        [Required]
        public string Name { get; set; }
        public string LicenceKey { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}