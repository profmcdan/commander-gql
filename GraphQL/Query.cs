using System.Linq;
using CommanderGQL.Data;
using CommanderGQL.Models;
using HotChocolate;
using HotChocolate.Data;
using HotChocolate.Types;

namespace CommanderGQL.GraphQL
{
    public class Query
    {
        [UseDbContext(typeof(AppDbContext))]
        [UseSorting]
        [UseFiltering]
        [UseOffsetPaging]
        public IQueryable<Platform> GetPlatform([ScopedService] AppDbContext  context)
        {
            return context.Platforms;
        }

        
        [UseDbContext(typeof(AppDbContext))]
        [UseSorting]
        [UseFiltering]
        [UseOffsetPaging]
        public IQueryable<Command> GetCommand([ScopedService] AppDbContext context)
        {
            return context.Commands;
        }
    }
}