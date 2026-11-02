Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC60606A326
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 19:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE63410F176;
	Mon,  2 Nov 2026 19:02:21 +0000 (UTC)
X-Greylist: delayed 490 seconds by postgrey-1.36 at gabe;
 Mon, 02 Nov 2026 19:02:20 UTC
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC5B10F176
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Nov 2026 19:02:20 +0000 (UTC)
Received: from dummy.faircode.eu (unknown
 [IPv6:2400:2410:b120:f200:e40d:db0b:2b2f:ac15])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 1335B3F1E7
 for <intel-gfx@lists.freedesktop.org>; Mon,  2 Nov 2026 19:54:07 +0100 (CET)
Date: Tue, 3 Nov 2026 03:53:59 +0900
From: Simon.Richter@hogyros.de
To: intel-gfx@lists.freedesktop.org
Message-ID: <da96dc26-f7f5-47b1-984a-569c1866ce1d@hogyros.de>
Subject: Component swizzling during output, and synchronous output
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <da96dc26-f7f5-47b1-984a-569c1866ce1d@hogyros.de>
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I have a video mixing desk which can accept a second input as a key=20
source, translating luminance to opacity.

The obvious way to generate this is to build a compositor that provides=20
an RGBA render target to applications, and then copies that to two output=
=20
framebuffers.

Can I somehow skip that extra step and configure the RAMDACs to read the=20
RGBA framebuffer directly (sending .rgb to one output, and .aaa to the=20
other)?

Also, is there a way to synchronise two outputs that have the same=20
resolution, so that the delay inside the mixing desk is the same?

=C2=A0=C2=A0 Simon
