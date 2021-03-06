I represent the session environment of a TelegramSmalltalkBot for a particular user. I am capable of holding variable bindings, remembering message references and outputs, and evaluating user code against the session context.

Instance Variables
	bindings:		Dictionary that maps strings to user objects.
	answers:		WeakValueDictionary that stores message sent by the bot associated with their IDs. Used to edit these messages if the referenced message has been edited.
	pinnedAnswers:		Collection that holds strong references to the answers. See explanation of pinning below.
	results:		WeakValueDictionary that stores output objects of messages sent by the bot, associated with the messages' IDs. Used to provide the receiver context for a user message referencing to an earlier bot message.
	pinnedResults:		Collection that holds strong references to the results. See explanation of pinning below.
	pinnedClosures:		WeakKeyDictionary that holds references to BlockClosures that are registered in the weak-referencing EventManager database.

# Pinning
To serve scalability when running a bot with many frequent users, I support automatic recycling of older session contents ("records") by making use of the GC. To implement this, the relevant records theirselves (answers and results) are hold using weak references only, and a limittable list of the most recent records is kept in memory using the pinned collections. See #tidyUpRecords: for releasing older records.