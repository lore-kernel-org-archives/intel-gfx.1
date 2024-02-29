Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFD7C5478C
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Mar 2024 14:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AED71121D2;
	Mon,  4 Mar 2024 14:11:35 +0000 (UTC)
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3974F10E14D
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Feb 2024 13:38:43 +0000 (UTC)
Date: Thu, 29 Feb 2024 13:38:36 +0000
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
From: maksym@wezdecki.pl
Subject: GuC WOPCM question
Message-ID: <ofHI3xyKkb9iYt50EDYlfISakCPoVMEUxFIJWxmrZiw6aOjyQSFSan_mtG0Y8OXV5M8eCvrNvkwsDR_uAY3_Xn3_w1d1lAM6dxBdrfoyC_o=@wezdecki.pl>
Feedback-ID: 47772235:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 04 Mar 2024 14:11:34 +0000
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

Hi,

I understand that GuC is 32bit uController, so it has access only to 4GB GT=
T.

I don't understand WOPCM and GTT conjunction.

From i915 doc we can see that:
   +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D+ <=3D=3D FFFF_FFFF
   ^             |      Reserved      |
   |             +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+ <=3D=3D GUC_GGTT_TOP
   |             |                    |
   |             |        DRAM        |
  GuC            |                    |
Address    +=3D=3D=3D> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+ <=3D=3D GuC ggtt_pin_bias
 Space     ^     |                    |
   |       |     |                    |
   |      GuC    |        GuC         |
   |     WOPCM   |       WOPCM        |
   |      Size   |                    |
   |       |     |                    |
   v       v     |                    |
   +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+ <=3D=3D 0000_0000

Can the range of (from 0x0000_0000 to "GuC ggtt_pin_bias") be used by other=
 parts of the KMD? Or this range is reserved only for GuC WOPCM and shouldn=
't be used by KMD driver for other allocations?

Thanks for reply,
Maksym=20


