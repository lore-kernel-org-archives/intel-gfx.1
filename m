Return-Path: <SRS0=q0LQ=O3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D88C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 03:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8C1A610A5
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Oct 2021 03:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8C1A610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7F66E827;
	Thu,  7 Oct 2021 03:16:59 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FF16E821
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Oct 2021 03:16:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-1MCZzv_XOZ-HNvvPEcFczQ-1; Wed, 06 Oct 2021 23:16:53 -0400
X-MC-Unique: 1MCZzv_XOZ-HNvvPEcFczQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 530BE100C609;
 Thu,  7 Oct 2021 03:16:52 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3DE85D9C6;
 Thu,  7 Oct 2021 03:16:50 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Dave Airlie <airlied@redhat.com>
Date: Thu,  7 Oct 2021 13:13:13 +1000
Message-Id: <20211007031318.3088987-4-airlied@gmail.com>
In-Reply-To: <20211007031318.3088987-1-airlied@gmail.com>
References: <20211007031318.3088987-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Subject: [Intel-gfx] [PATCH 3/8] drm/i915/display: refactor out initial
 plane config for crtcs
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This just pulls this out into a function so it can be moved to
another file easier.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 44 +++++++++++---------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm=
/i915/display/intel_display.c
index b26e1989b8d8..cc1707453a94 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11450,6 +11450,30 @@ int intel_modeset_init_noirq(struct drm_i915_priva=
te *i915)
 =09return ret;
 }
=20
+static void
+intel_crtc_initial_plane_config(struct intel_crtc *crtc)
+{
+=09struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
+=09struct intel_initial_plane_config plane_config =3D {};
+
+=09/*
+=09 * Note that reserving the BIOS fb up front prevents us
+=09 * from stuffing other stolen allocations like the ring
+=09 * on top.  This prevents some ugliness at boot time, and
+=09 * can even allow for smooth boot transitions if the BIOS
+=09 * fb is large enough for the active pipe configuration.
+=09 */
+=09dev_priv->display->get_initial_plane_config(crtc, &plane_config);
+
+=09/*
+=09 * If the fb is shared between multiple heads, we'll
+=09 * just get the first one.
+=09 */
+=09intel_find_initial_plane_obj(crtc, &plane_config);
+
+=09plane_config_fini(&plane_config);
+}
+
 /* part #2: call after irq install, but before gem init */
 int intel_modeset_init_nogem(struct drm_i915_private *i915)
 {
@@ -11511,27 +11535,9 @@ int intel_modeset_init_nogem(struct drm_i915_priva=
te *i915)
 =09drm_modeset_unlock_all(dev);
=20
 =09for_each_intel_crtc(dev, crtc) {
-=09=09struct intel_initial_plane_config plane_config =3D {};
-
 =09=09if (!to_intel_crtc_state(crtc->base.state)->uapi.active)
 =09=09=09continue;
-
-=09=09/*
-=09=09 * Note that reserving the BIOS fb up front prevents us
-=09=09 * from stuffing other stolen allocations like the ring
-=09=09 * on top.  This prevents some ugliness at boot time, and
-=09=09 * can even allow for smooth boot transitions if the BIOS
-=09=09 * fb is large enough for the active pipe configuration.
-=09=09 */
-=09=09i915->display->get_initial_plane_config(crtc, &plane_config);
-
-=09=09/*
-=09=09 * If the fb is shared between multiple heads, we'll
-=09=09 * just get the first one.
-=09=09 */
-=09=09intel_find_initial_plane_obj(crtc, &plane_config);
-
-=09=09plane_config_fini(&plane_config);
+=09=09intel_crtc_initial_plane_config(crtc);
 =09}
=20
 =09/*
--=20
2.25.4

