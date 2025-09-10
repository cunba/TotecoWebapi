using System.Linq.Expressions;

namespace TotecoApi.Repositories;

public interface IGenericRepository<T> where T : class
{
    Task<List<T>> GetAllAsync();
    Task<T?> GetByIdAsync(string id);
    Task AddAsync(T t);
    Task UpdateAsync(T t);
    Task DeleteAsync(string id);
    Task<List<T>> FindAsync(Expression<Func<T, bool>> predicate);
}
