namespace ToolBox
{
    public interface ICommand
    {
        void AddParameter(string parameterName, object value);
        void ClearParameters();
        void RemoveParameter(string parameterName);
    }
}