// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Represents a NATS connection.
public type Connection object {

    private ConnectionConfig config = {};
    private string url;

    # Initializes a connection with the NATS server.
    #
    # + url - NATS Broker URL. For a clustered use case, pass the URLs as comma-separated values.
    # + config - Information necessary for the NATS client to establish a connection with the server.
    public function __init(string url, ConnectionConfig? config = ()) {
        self.config = config ?: {};
        self.url = url;
        self.init(self.url, self.config);
    }

    function init(string url, ConnectionConfig config) = external;

    # Closes a given connection.
    #
    # + forceful - The graceful shutdown flag. If `true`, the connection closes immediately.
    # By default, this is set to false.
    # + return - Returns () or the error if unable to complete the close operation.
    public function close(boolean? forceful = ()) returns NatsError? = external;
};
