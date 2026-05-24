# CAR Deploy Flow (Mac -> GitHub -> Pi)

## One-time setup on Pi

```bash
cd ~
git clone git@github.com:MyTeachingSheets/CAR.git
cd ~/CAR
chmod +x scripts/deploy_pi.sh scripts/deploy_remote.sh
```

Allow service restart without password for deploy command:

```bash
sudo visudo
```

Add this line at end:

```text
creative ALL=(ALL) NOPASSWD: /bin/systemctl restart rplidar.service, /bin/systemctl restart foxglove-bridge.service
```

## Daily workflow

On Mac, after code changes:

```bash
cd /Users/sahithsambodhi/Desktop/CAR
git add .
git commit -m "your update"
git push
```

Deploy to Pi from Mac with one command:

```bash
cd /Users/sahithsambodhi/Desktop/CAR
chmod +x scripts/deploy_remote.sh
./scripts/deploy_remote.sh
```

## What deploy script does

1. SSH into Pi
2. Pull latest `main` branch
3. Restart `rplidar.service` and `foxglove-bridge.service`
4. Print active status
