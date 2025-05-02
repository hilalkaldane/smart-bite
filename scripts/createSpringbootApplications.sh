#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <service-name>"
  echo "Example: $0 user-service"
  exit 1
fi

SERVICE=$1
GROUP_ID="com.smartbite"
PKG_NAME="${SERVICE//-/}"
CLASS_BASE=""

IFS='-' read -ra PARTS <<< "$SERVICE"
for p in "${PARTS[@]}"; do
  CLASS_BASE+="${p^}"
done

PACKAGE_DIR="com/smartbite/$PKG_NAME"
SRC_MAIN_JAVA="apps/$SERVICE/src/main/java/$PACKAGE_DIR"

CONTROLLER_CLASS="${CLASS_BASE}Controller"
CONTROLLER_FILE="${SRC_MAIN_JAVA}/${CONTROLLER_CLASS}.java"

echo "🛠️  Adding ${CONTROLLER_CLASS} to ${SERVICE} with mapping '/${SERVICE}'..."

cat > "$CONTROLLER_FILE" <<EOF
package ${GROUP_ID}.${PKG_NAME};

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/${SERVICE}")
public class ${CONTROLLER_CLASS} {

    @GetMapping
    public String index() {
        return "Hello from ${SERVICE}";
    }
}
EOF

echo "✅ Created: ${CONTROLLER_FILE}"
