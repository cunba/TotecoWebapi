using System.Linq.Expressions;

namespace TotecoApi.Services;

public interface IGenericService<T> where T : class
{
    Task<List<T>> GetAllAsync();
    Task<T?> GetByIdAsync(string id);
    Task<T> CreateAsync(T entity);
    Task<T?> UpdateAsync(string id, T entity);
    Task<bool> DeleteAsync(string id);
    Task<List<T>> FindAsync(Expression<Func<T, bool>> predicate);
}
