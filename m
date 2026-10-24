Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C07606A31F
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqwMGkOm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B032F10F4CB;
	Tue, 27 Oct 2026 13:16:22 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95C010E534
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 12:33:51 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1931ff67a29so3067668c88.1
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792845231; x=1793450031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UcH8rYHopQiyfN2N9CeJ5UIPAEXGC3cUJ4H4eP6mIrA=;
 b=IqwMGkOmyHODEawLRX+U9lG54t/wiWl4u9a0cZKAhH8lHBgsHpYHmFbadbME+XM1i5
 UJiLXWDDUNuBC5bgQfANxkDX/yDCXdUhqAQP1OuinTO/ygeztFqOmEXrVYRLNZIu8m8W
 wW6Jf5AFmUNJz+MW4oeJsZF/lrQMI2QwA2hqTH7jctP59XQD6+Kfh3xztjRdbOlpYWxZ
 chcia/zojf0sXrA+PQVRnHRq1c/oHDLuizyOe1O6NFxvm4+i1v0WimLLJNyz1L/kAgmo
 shWNH36dwI7S9/wxJ4lAftZ0e5qNOrO0ytNKo1z4ZmdJwIleNjs7cQqWMl0pZlZ29X9Y
 gRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792845231; x=1793450031;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UcH8rYHopQiyfN2N9CeJ5UIPAEXGC3cUJ4H4eP6mIrA=;
 b=r53ZigzobsbMSFgytorkgMu5uAYbQhE80Wt4AkhCj2FewcJgxote9ryLYBOnSB0yJl
 9JiR2yaWHP549eYb9FtWHsJdUP7FFkuvc83suzDV9Jm6IdsXyLRJB/7S0FZqcSQP5/LA
 dtCSVWCX9mdKY4G3BOrbeSq0Dfjo3QBJTo/AeT3La/hLkpA3RvzrH/1ub+wstaiX7nsO
 xiCprllgX8uVqvg3ijAnJykoph3d4jvWa1QGakLrXJXPjScVp5D+uaCG0NS6cYwc/pUG
 E38Q+XrYJju7UiLfleXnxO4iHV1vJlWli4iKTV32L717T8xMfJM7ixA0GFGYZmnbGoCQ
 yhBw==
X-Gm-Message-State: AFq9FYJv0q0zExVJQfHlImWiNsTwED9KiT/59eKw6eWhjGMkRnkcXSTy
 SHdvDRtj6JZDNngMLVNnTeKeoTJztSlyShpJUXjz7gl1sbr44+ySTz7fzNcRu7KG
X-Gm-Gg: AYBFou2hcYLWtWT4pqhANVsIpWNk1RWXBSF2tU8zbk87VWNSzwS2IOTrFSNsVcgBMhx
 MLil2hkUxplgIoGF/k7Rtkip5OJpV05XvULwKzPuFPLLM2A4SdDi5g9G6nmtIe0miCSTP5BGtzP
 d/bGySx4a+F9V3utIVuIKB4rwLHv6mhiHnVa+ihCFF3xLUBmgAoUHwzHeGSbPkrIkN/rxyiSfCJ
 OpIkpjikTbq1zHUsDc8mntGC97IdBuOgeFIEVp7hgqpapZRE+yGF5uY2/DSadZ1RDqulCcQOIUi
 kPcUDuObPkZw1RQ+CnFiSmvRj/J+WMOhlHnkToc0ElC+rSmgxcuuyhRmvmwv1kIy4YSXJslx6IR
 IB7U97gbLebdVYtzouKh9eitZxNlenWLNEPNvz0sUZueb/Vv4g7xkkO3ses5COHOIQ1VO9Ddl80
 MibLLiVIcdUmrisK3X2BelXwYFVUcU9GQzZ66c13ICxY6s4v/XX4xb5gcmG3H7mnl/e3xOdJClz
 uDd92YiFZZJxGDF7YdmA2iWD367bQF4OHxdsJZiA+1kmqHja1c1pk65mS+KNHsvQPUtsgMUA0V6
 dxTkIXKnKWkRWns=
X-Received: by 2002:a05:7022:7f18:b0:143:296a:3ee with SMTP id
 a92af1059eb24-1993571a3bemr3230839c88.25.1792845230770; 
 Sat, 24 Oct 2026 05:33:50 -0700 (PDT)
Received: from [127.0.1.1] ([2406:7400:129:3e65:f4a6:5e8f:7da4:c9bb])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-19894d5a470sm6295559c88.2.2026.10.24.05.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 05:33:50 -0700 (PDT)
From: Aman Sharma <amansharma6122002@gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Aman Sharma <amansharma6122002@gmail.com>
Subject: [PATCH v2] drm/i915/hdmi: preserve cached EDID on DDC failure when
 connector is forced
Date: Sat, 24 Oct 2026 18:03:43 +0530
Message-ID: <179284522321.1666644.7085985666852699043@gmail.com>
In-Reply-To: <179284356403.1659508.10439113185286055496@gmail.com>
References: <179284356403.1659508.10439113185286055496@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Oct 2026 13:16:21 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When an HDMI connector is forced enabled (e.g. via video=HDMI-A-1:e for
laptop clamshell operation) and the external monitor enters DPMS standby,
some monitors (such as the BenQ GW2790Q) power down their internal DDC/I2C
controller, causing SCDC/EDID reads to fail with -ENXIO (-6).

Currently, intel_hdmi_detect() and intel_hdmi_force() unconditionally call
intel_hdmi_unset_edid() before calling intel_hdmi_set_edid(). When
drm_edid_read_ddc() returns NULL during monitor standby, the connector's
cached detect_edid is wiped out and
drm_helper_probe_single_connector_modes() falls back to the 1024x768 VESA
no-EDID mode. When the monitor wakes back up, because the connector status
remained forced to connector_status_connected, no hotplug state transition
occurs and the display remains stuck at 1024x768 until a manual mode probe
(such as toggling the laptop lid) is triggered.

Fix this by moving intel_hdmi_unset_edid() into intel_hdmi_set_edid() after
checking whether a forced connector already has a valid cached EDID
(detect_edid and edid_blob_ptr) when DDC fails, and only clearing
detect_edid on Gen11+ digital port disconnect when the connector is not
forced. When the monitor is awake or a different monitor is plugged in,
drm_edid_read_ddc() succeeds, resets the previous EDID and dp_dual_mode
state via intel_hdmi_unset_edid(), and updates the connector with the new
EDID.

v2:
- Move intel_hdmi_unset_edid() into intel_hdmi_set_edid() so hotplug
  detection via intel_hdmi_detect() also preserves the cached EDID on
  forced connectors and resets dp_dual_mode when updating EDID.
- Clear detect_edid on Gen11+ disconnect when the connector is unforced,
  and verify edid_blob_ptr is non-NULL before retaining detect_edid.

Signed-off-by: Aman Sharma <amansharma6122002@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 25 +++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index b6fa1a1558b8..89ab9a790a41 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2570,6 +2570,19 @@ intel_hdmi_set_edid(struct drm_connector *_connector)
 		intel_gmbus_force_bit(ddc, false);
 	}
 
+	/*
+	 * If the connector is forced on (e.g. video=HDMI-A-1:e) and the sink's
+	 * DDC/I2C bus is powered down during DPMS standby, keep the previously
+	 * cached EDID rather than wiping it and falling back to 1024x768.
+	 */
+	if (!drm_edid && connector->base.force &&
+	    connector->detect_edid && connector->base.edid_blob_ptr) {
+		intel_display_power_put(display, POWER_DOMAIN_GMBUS, wakeref);
+		return true;
+	}
+
+	intel_hdmi_unset_edid(&connector->base);
+
 	/* Below we depend on display info having been updated */
 	drm_edid_connector_update(&connector->base, drm_edid);
 
@@ -2611,10 +2624,11 @@ intel_hdmi_detect(struct drm_connector *_connector, bool force)
 	wakeref = intel_display_power_get(display, POWER_DOMAIN_GMBUS);
 
 	if (DISPLAY_VER(display) >= 11 &&
-	    !intel_digital_port_connected(encoder))
+	    !intel_digital_port_connected(encoder)) {
+		if (!connector->base.force)
+			intel_hdmi_unset_edid(&connector->base);
 		goto out;
-
-	intel_hdmi_unset_edid(&connector->base);
+	}
 
 	if (intel_hdmi_set_edid(&connector->base))
 		status = connector_status_connected;
@@ -2638,10 +2652,10 @@ intel_hdmi_force(struct drm_connector *_connector)
 	if (!intel_display_driver_check_access(display))
 		return;
 
-	intel_hdmi_unset_edid(&connector->base);
-
-	if (connector->base.status != connector_status_connected)
+	if (connector->base.status != connector_status_connected) {
+		intel_hdmi_unset_edid(&connector->base);
 		return;
+	}
 
 	intel_hdmi_set_edid(&connector->base);
 }
-- 
2.43.0
