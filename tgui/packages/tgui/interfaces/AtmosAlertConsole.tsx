import { useBackend } from '../backend';
import { Section } from '../components';
import { Window } from '../layouts';

type Data = {
  priority: string[]
  minor: string[]
}

export const AtmosAlertConsole = props => {
  const { act, data } = useBackend<Data>();
  const { priority = [], minor = [] } = data;

  return (
    <Window width={350} height={300}>
      <Window.Content scrollable>
        <Section title='Alarms'>
          <ul>
            {priority.length === 0 && (
              <li className='color-good'>No Priority Alerts</li>
            )}
            {priority.map(alert => (
              <li key={alert}>{alert}</li>
            ))}
            {minor.length === 0 && (
              <li className='color-good'>No Minor Alerts</li>
            )}
            {minor.map(alert => (
              <li key={alert}>{alert}</li>
            ))}
          </ul>
        </Section>
      </Window.Content>
    </Window>
  );
};
