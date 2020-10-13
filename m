Return-Path: <SRS0=Vt61=DU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1AEC433DF
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 13:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC92724788
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 13:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC92724788
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AC66E8EB;
	Tue, 13 Oct 2020 13:54:15 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579536E8BC;
 Tue, 13 Oct 2020 11:12:47 +0000 (UTC)
Date: Tue, 13 Oct 2020 13:12:32 +0200
From: Paul Cercueil <paul@crapouillou.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-Id: <WG05IQ.DABE5ILJAA631@crapouillou.net>
In-Reply-To: <20201012152452.432c4867@canb.auug.org.au>
References: <20201008140903.12a411b8@canb.auug.org.au>
 <20201008154202.175fbec7@canb.auug.org.au>
 <20201012152452.432c4867@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Oct 2020 13:54:08 +0000
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the
 drm-misc tree
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Stephen,

Le lun. 12 oct. 2020 =E0 15:24, Stephen Rothwell <sfr@canb.auug.org.au> =

a =E9crit :
> Hi all,
> =

> On Thu, 8 Oct 2020 15:42:02 +1100 Stephen Rothwell =

> <sfr@canb.auug.org.au> wrote:
>> =

>>  On Thu, 8 Oct 2020 14:09:03 +1100 Stephen Rothwell =

>> <sfr@canb.auug.org.au> wrote:
>>  >
>>  > After merging the drm-misc tree, today's linux-next build (x86_64
>>  > allmodconfig) failed like this:
>> =

>>  In file included from include/linux/clk.h:13,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:10:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function =

>> 'ingenic_drm_update_palette':
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/kernel.h:47:33: note: in definition of macro =

>> 'ARRAY_SIZE'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                 ^~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/kernel.h:47:48: note: in definition of macro =

>> 'ARRAY_SIZE'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                                ^~~
>>  In file included from include/linux/bits.h:22,
>>                   from include/linux/bitops.h:5,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm.h:10,
>>                   from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:7:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/build_bug.h:16:62: note: in definition of macro =

>> 'BUILD_BUG_ON_ZERO'
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { =

>> int:(-!!(e)); })))
>>        |                                                             =

>>  ^
>>  include/linux/compiler.h:224:46: note: in expansion of macro =

>> '__same_type'
>>    224 | #define __must_be_array(a) =

>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                                              ^~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro =

>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                                           =

>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in =

>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                  ^~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                                   ^~~~~~~~~~~
>>  include/linux/build_bug.h:16:62: note: in definition of macro =

>> 'BUILD_BUG_ON_ZERO'
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { =

>> int:(-!!(e)); })))
>>        |                                                             =

>>  ^
>>  include/linux/compiler.h:224:46: note: in expansion of macro =

>> '__same_type'
>>    224 | #define __must_be_array(a) =

>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                                              ^~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro =

>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                                           =

>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in =

>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                  ^~~~~~~~~~
>>  include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' =

>> width not an integer constant
>>     16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { =

>> int:(-!!(e)); })))
>>        |                                                   ^
>>  include/linux/compiler.h:224:28: note: in expansion of macro =

>> 'BUILD_BUG_ON_ZERO'
>>    224 | #define __must_be_array(a) =

>> BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>>        |                            ^~~~~~~~~~~~~~~~~
>>  include/linux/kernel.h:47:59: note: in expansion of macro =

>> '__must_be_array'
>>     47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + =

>> __must_be_array(arr))
>>        |                                                           =

>> ^~~~~~~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in =

>> expansion of macro 'ARRAY_SIZE'
>>    448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); =

>> i++) {
>>        |                  ^~~~~~~~~~
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:453:9: error: 'struct =

>> ingenic_drm' has no member named 'dma_hwdescs'; did you mean =

>> 'dma_hwdesc_f0'?
>>    453 |   priv->dma_hwdescs->palette[i] =3D color;
>>        |         ^~~~~~~~~~~
>>        |         dma_hwdesc_f0
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function =

>> 'ingenic_drm_plane_atomic_update':
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: error: =

>> 'crtc_state' undeclared (first use in this function); did you mean =

>> 'ctx_state'?
>>    467 |   crtc_state =3D state->crtc->state;
>>        |   ^~~~~~~~~~
>>        |   ctx_state
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: note: each =

>> undeclared identifier is reported only once for each function it =

>> appears in
>>  At top level:
>>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c:443:13: warning: =

>> 'ingenic_drm_update_palette' defined but not used [-Wunused-function]
>>    443 | static void ingenic_drm_update_palette(struct ingenic_drm =

>> *priv,
>>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> =

>>  > I noticed that the ingenic driver revert I had been waiting for =

>> appeared
>>  > in hte drm-misc tree, so I removed the BROKEN dependency for it, =

>> but it
>>  > produced the above errors, so I have marked it BROKEN again.
> =

> Any progress on this?  I am still marking CONFIG_DRM_INGENIC as BROKEN
> in the drm and drm-misc trees.

It should be good now.

Cheers,
-Paul


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
